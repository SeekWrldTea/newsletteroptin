class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_domain
  before_action :load_layout_data
  before_action :header_footer

  add_breadcrumb 'Accueil', :root_path

  def admin_controller?
    self.class < RailsAdmin::ApplicationController
  end

  def header_footer
    @h1 = nil
    menu = Menu.find_by_code(current_domain)
    @menu_associations = MenuAssociation.where(menu_id: menu.id).roots
    @viadeo = Parameter.find_by_code('VIADEO_'+current_domain)
    @googleplus = Parameter.find_by_code('GOOGLEPLUS_'+current_domain)
    @facebook = Parameter.find_by_code('FACEBOOK_'+current_domain)
    @agencies = Agency.joins(:domain).where('domains.code = ?', current_domain)
  end

private

  def current_domain
    request.domain.include?('segine') || request.subdomain.include?('segine') ? code_domain = 'SEGINE' : code_domain = 'IMMO_VICTOIRE'
    code_domain
  end

  def load_layout_data
    @seo_title = Parameter.find_by_code('DEFAULT_SEO_TITLE_'+current_domain)
    @seo_description = Parameter.find_by_code('DEFAULT_SEO_DESCRIPTION_'+current_domain)
  end
end
