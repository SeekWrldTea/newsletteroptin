class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image, null: false
      t.references :property, foreign_key: true, null: false

      t.timestamps
    end
  end
end
