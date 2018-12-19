class PropertiesController < ApplicationController
  before_action :find_type
  before_action :find_property, except: [:index, :query]

  def index
    domain = Domain.find_by_code(current_domain)
    @locations = Property.where(type_offer: @type, domain_id: domain.id).pluck(:postal_code, :city).uniq.sort!
    @type_properties = Property.where(type_offer: @type, domain_id: domain.id).pluck(:type_property).uniq.sort!
    @cities = Property.where(type_offer: @type, domain_id: domain.id).pluck(:city).uniq.sort!

    @step_area = 20

    @areas = {}
    if @area_max.present?
      (0..@area_max).step(@step_area).each do |i|
        @areas[i] = ActionController::Base.helpers.number_with_delimiter(i, locale: :fr).to_s+ ' m²'
        if i < @area_max
          @areas[i] += ' - '+ActionController::Base.helpers.number_with_delimiter(i+@step_area, locale: :fr).to_s+ ' m²'
        else
          @areas[i] += ' et plus'
        end
      end
    end

    params[:filter] = {type_properties: nil, cities: nil, areas: nil}

    if (@type == 'Vente')
      add_breadcrumb 'Nos biens à vendre'
    else
      add_breadcrumb 'Nos biens à louer'
    end

  end

  def query
    @properties = if (request.filtered_parameters['properties'].to_s == 'biens-a-vendre')
      Property.sale
    else
      Property.rent
    end
    domain = Domain.find_by_code(current_domain)
    @properties = @properties.where(domain_id: domain.id).order(updated_at: :desc).page(params[:page]).per(12)

    params.permit!
    if params[:filter].present?
      if params[:filter][:type_properties].present?
        @properties = @properties.type_properties(params[:filter][:type_properties])
      end
      if params[:filter][:cities].present?
        @properties = @properties.cities(params[:filter][:cities])
      end
      if params[:filter][:areas].present?
        @properties = @properties.area_min(params[:filter][:areas].to_i)
        if((params[:filter][:areas].to_i + @step_area) < @area_max)
          @properties = @properties.area_max((params[:filter][:areas].to_i + @step_area))
        end
      end
    end
    render 'properties/query', layout: false
  end

  def show
    domain = Domain.find_by_code(current_domain)
    if (@property.type_offer == 'Vente')
      add_breadcrumb 'Nos biens à vendre', properties_path(properties: 'biens-a-vendre')
      @categories_actualites = Category.find_by_slug('actualites-transactions')
      @widget_guide = Widget.where('domain_id = ?', domain.id)
                          .where('title = ?', 'Le guide de la transaction')
                          .first
    else
      add_breadcrumb 'Nos biens à louer', properties_path(properties: 'biens-a-louer')
      @categories_actualites = Category.find_by_slug('actualites-gestion-locatives')
      @widget_guide = Widget.where('domain_id = ?', domain.id)
                          .where('title = ?', 'Constitution de votre dossier')
                          .first
    end
    add_breadcrumb @property.title.capitalize
    @h1 = @property.title.capitalize
    @contact = Contact.new
    @last_properties = Property.where(type_offer: @type, domain_id: domain.id).where('properties.id != ?', @property.id).limit(3)
    @articles = Article.joins(:categories)
                    .published
                    .where('categories.slug = ?', @categories_actualites.slug)
                    .where('domain_id = ?', domain.id)
                    .limit(3)
    @agency = Agency.find_by_domain_id(domain.id)
  end

  def contact_property_create
    @contact = Contact.new(contact_property_params)
    domain = Domain.find_by_code(current_domain)
    if (@property.type_offer == 'Vente')
      add_breadcrumb 'Nos biens à vendre', properties_path(properties: 'biens-a-vendre')
      @categories_actualites = Category.find_by_slug('actualites-transactions')
      @widget_guide = Widget.where('domain_id = ?', domain.id)
                          .where('title = ?', 'Le guide de la transaction')
                          .first
    else
      add_breadcrumb 'Nos biens à louer', properties_path(properties: 'biens-a-louer')
      @categories_actualites = Category.find_by_slug('actualites-gestion-locatives')
      @widget_guide = Widget.where('domain_id = ?', domain.id)
                          .where('title = ?', 'Constitution de votre dossier')
                          .first
    end
    @contact.domain_id = domain.id
    @contact.property = @property
    @last_properties = Property.where(type_offer: @type, domain_id: domain.id).where('properties.id != ?', @property.id).limit(3)
    @articles = Article.joins(:categories)
                    .published
                    .where('categories.slug = ?', @categories_actualites.slug)
                    .where('domain_id = ?', domain.id)
                    .limit(3)
    @agency = Agency.find_by_domain_id(domain.id)

    unless verify_recaptcha
      render 'show' and return
    end

    if @contact.save
      @contact.send_notifications!
      redirect_to contact_success_path
    else
      render 'show'
    end
  end

private

  def find_type
    if request.path == '/biens-a-vendre'
      @type = 'Vente'
      @h1 = 'Nos biens à vendre'
      @seo_title = 'Nos biens à vendre'
    else
      @type = 'Location'
      @h1 = 'Nos biens à louer'
      @seo_title = 'Nos biens à louer'
    end
    @step_area = 20
    @area_max = Property.where(type_offer: @type).maximum('living_space')
  end

  def find_property
    @property = Property.friendly.find params[:id]
  end

  def contact_property_params
    params.require('contact').permit(:name, :email, :phone, :message, :code_form, :property_id)
  end

end
