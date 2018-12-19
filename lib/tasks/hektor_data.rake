require 'open-uri'

namespace :hektor_data do

  desc 'Import flux hektor'
  # rake hektor_data:import[SEGINE]
  # rake hektor_data:import[IMMO_VICTOIRE]
  task :import, [:domain_code] => :environment do |t, args|
    domain = Domain.find_by_code(args[:domain_code])

    case args[:domain_code]
      when "SEGINE"
        directory = 'segine'
      when "IMMO_VICTOIRE"
        directory = 'immovi'
      end

    # feed = Rails.configuration.hektor_directory+args[:domain_code].downcase+'/hektor.xml'
    feed = Rails.configuration.hektor_directory+directory+'/hektor.xml'
    data = Nokogiri::XML(File.open(feed))
    properties_in_database = []
    new_properties = []

    Property.where(domain_id: domain.id).each do |p|
      properties_in_database << p.reference
    end

    data.search('ad').each do |property_xml|
      if(property_xml.at('ville').text.present? && property_xml.at('cp').text.present?)
        property = Property.where(reference: property_xml.at('reference').text.upcase, domain_id: domain.id).first_or_initialize
        property.domain_id            = domain.id
        property.hektor_id            = property_xml.at('id').text
        property.title                = property_xml.at('titre').text.capitalize
        # property.body                 = property_xml.at('corps').text.capitalize
        property.body                 = property_xml.at('corps').text
        property.type_offer           = property_xml.at('type_offre').text
        property.type_property        = property_xml.at('type_bien').text
        property.price                = property_xml.at('prix').text
        property.charges              = property_xml.at('charges').text if property_xml.at('charges').present?
        property.property_tax         = property_xml.at('foncier').text if property_xml.at('foncier').present?
        property.nb_floors            = property_xml.at('nb_etages').text if property_xml.at('nb_etages').present?
        property.floor                = property_xml.at('etage').text if property_xml.at('etage').present?
        property.city                 = is_paris?(property_xml.at('ville').text, property_xml.at('cp').text).titleize
        property.postal_code          = property_xml.at('cp').text
        property.cons_energy          = property_xml.at('cons_energie').text if property_xml.at('cons_energie').present?
        property.class_energy         = property_xml.at('class_energie').text if property_xml.at('class_energie').present?
        property.emission_gaz         = property_xml.at('emission_gaz').text if property_xml.at('emission_gaz').present?
        property.class_emission_gaz   = property_xml.at('class_emission_gaz').text if property_xml.at('class_emission_gaz').present?
        property.living_space         = property_xml.at('surface_habitable').text if property_xml.at('surface_habitable').present?
        property.land_area            = property_xml.at('surface_terrain').text if property_xml.at('surface_terrain').present?
        property.nb_rooms             = property_xml.at('nb_pieces').text if property_xml.at('nb_pieces').present?
        property.bedroom              = property_xml.at('chambres').text if property_xml.at('chambres').present?
        property.bathroom             = property_xml.at('sdb').text if property_xml.at('sdb').present?
        property.shower_room          = property_xml.at('sde').text if property_xml.at('sde').present?
        property.restroom             = property_xml.at('wc').text if property_xml.at('wc').present?
        property.kitchen              = property_xml.at('cuisine').text.capitalize if property_xml.at('cuisine').present?
        property.parking              = property_xml.at('parking').text if property_xml.at('parking').present?
        property.swimming_pool        = property_xml.at('piscine').text if property_xml.at('piscine').present?
        property.balcony              = property_xml.at('balcon').text if property_xml.at('balcon').present?
        property.terrace              = property_xml.at('terrasse').text if property_xml.at('terrasse').present?
        property.heating              = property_xml.at('chauffage').text.capitalize if property_xml.at('chauffage').present?
        property.heating_energy       = property_xml.at('energie_chauffage').text.capitalize if property_xml.at('energie_chauffage').present?
        property.heating_format       = property_xml.at('format_chauffage').text.capitalize if property_xml.at('format_chauffage').present?
        #binding.pry

        property.save!

        images_in_database = []
        new_images = []

        Image.where(property_id: property.id).each do |i|
                images_in_database << i.id
        end

        property_xml.search('images/image').each do |media|
          media_name = media.text.to_s;

          image = Image.where(image: File.basename(media_name), property_id: property.id).first_or_initialize(remote_image_url: media_name, property_id: property.id)

          # image = Image.new // commenté le 26/01/2018
          #url = URI.parse(media.at('image').text)
          # image.remote_image_url = media.text.to_s // commenté le 26/01/2018
          # image.property = property // commenté le 26/01/2018
          image.save! if image.valid?
	  
          new_images << image.id
        end

        images_to_delete = images_in_database - new_images
# puts 'images_to_delete.inspect'
# puts images_to_delete.inspect
        images_to_delete.each do |id|
          image = Image.where(id: id, property_id: property.id).first
          image.destroy
        end

 
        new_properties << property_xml.at('reference').text
      end
    end

    properties_to_delete = properties_in_database - new_properties

    properties_to_delete.each do |reference|
      property = Property.where(reference: reference, domain_id: domain.id).first
      property.destroy
    end
  end

  def is_paris?(city, postal_code)
    if city.downcase == 'paris'
      cp_end = postal_code[3].to_s+postal_code[4].to_s
      if cp_end.to_s == '00'
        return city
      elsif cp_end.to_s == '01'
        return 'Paris 1er'
      elsif cp_end.to_s < '10'
        return 'Paris '+cp_end[1].to_s+'ème'
      else
        return 'Paris '+cp_end.to_s+'ème'
      end
    else
      return city
    end
  end

end


