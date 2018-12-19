  class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
    url = request.fullpath
    if url == '/confiez-nous-votre-immeuble'
      add_breadcrumb 'Confiez nous votre immeuble'
      @h1 = 'Confiez nous votre immeuble'
      render 'confiez-immeuble'
    elsif url == '/confiez-nous-la-gestion-de-votre-bien'
      add_breadcrumb 'Confiez-nous la gestion de votre bien'
      @h1 = 'Confiez-nous la gestion de votre bien'
      render 'confiez-gestion-bien'
    elsif url == '/confiez-nous-la-vente-de-votre-bien'
      add_breadcrumb 'Confiez-nous la vente de votre bien'
      @h1 = 'Confiez-nous la vente de votre bien'
      render 'confiez-vente-bien'
    elsif url == '/deposer-ma-candidature'
      add_breadcrumb 'Confiez-nous la vente de votre bien'
      @h1 = 'Je dépose ma candidature à une offre'
      render 'deposer-ma-candidature'
    else
      add_breadcrumb 'Nous contacter'
      @h1 = 'Nous contacter'
      render 'new'
    end
  end

  def create
    @contact = Contact.new(contact_params)
    domain = Domain.find_by_code(current_domain)
    @contact.domain_id = domain.id
    if contact_params[:other_lots]
      other_lots = []
      contact_params[:other_lots].each do |ol|
        other_lots << ol if (ol.length > 0)
      end
      @contact.other_lots = other_lots
    end
    render_specific_url unless verify_recaptcha
    if @contact.save
      @contact.send_notifications!
      redirect_to action: 'success'
    else
      render_specific_url
    end
  end

  def success
    add_breadcrumb 'Formulaire bien envoyé'
    @h1 = 'Formulaire bien envoyé'
  end

private

  def contact_params
    params.require('contact').permit(
        :name, :email, :phone, :message, :code_form, :main_lots,
        :second_lots, :energy, :elevator, :people, :syndical,
        :assembly_date, :postal_code, :city, :sort, :area, :rooms,
        :state, :job, :address, :recommendation, :cv, :cover_letter, other_lots: []
    )
  end

  def render_specific_url
    if url == '/confiez-nous-votre-immeuble'
      render 'confiez-immeuble'
    elsif url == '/confiez-nous-la-gestion-de-votre-bien'
      render 'confiez-gestion-bien'
    elsif url == '/confiez-nous-la-vente-de-votre-bien'
      render 'confiez-vente-bien'
    elsif url == '/deposer-ma-candidature'
      render 'confiez-vente-bien'
    else
      render 'new'
    end
  end


end
