class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.text :message, null: false
      t.references :domain, foreign_key: true, null: false
      t.string :code_form
      t.string :main_lots
      t.string :second_lots
      t.string :energy
      t.string :elevator
      t.string :people
      t.string :syndical
      t.string :assembly_date
      t.string :postal_code
      t.string :city
      t.string :sort
      t.string :area
      t.string :rooms
      t.string :state
      t.text :other_lots

      t.timestamps
    end
  end
end
