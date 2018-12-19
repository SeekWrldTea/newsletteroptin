class CreateAgencies < ActiveRecord::Migration[5.0]
  def change
    create_table :agencies do |t|
      t.string :title, null: false
      t.string :address, null: false
      t.string :latitude, null: false, default: 48.8589507
      t.string :longitude, null:false, default: 2.2775169
      t.integer :position, null:false, default: 1
      t.text :body, null: false
      t.references :domain, foreign_key: true, null: false

      t.timestamps
    end
  end
end
