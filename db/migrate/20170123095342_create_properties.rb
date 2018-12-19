class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.integer :hektor_id, null:false
      t.string :reference, null:false
      t.string :title, null:false
      t.text :body, null:false
      t.string :type_offer, null:false
      t.string :type_property, null:false
      t.integer :price, null:false
      t.integer :charges
      t.integer :property_tax
      t.integer :nb_floors
      t.integer :floor
      t.string :city, null:false
      t.integer :postal_code, null:false
      t.integer :cons_energy
      t.string :class_energy
      t.integer :emission_gaz
      t.string :class_emission_gaz
      t.integer :living_space
      t.integer :land_area
      t.integer :nb_rooms
      t.integer :bedroom
      t.integer :bathroom
      t.integer :shower_room
      t.integer :restroom
      t.string :kitchen
      t.integer :parking
      t.integer :swimming_pool
      t.integer :balcony
      t.integer :terrace
      t.string :heating
      t.string :heating_energy
      t.string :heating_format
      t.string :slug, index: {unique: true}

      t.timestamps
    end
  end
end
