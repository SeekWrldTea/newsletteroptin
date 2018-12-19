class CreateSliders < ActiveRecord::Migration[5.0]
  def change
    create_table :sliders do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.integer :position, null: false, default: 1
      t.references :domain, foreign_key: true, null: false

      t.timestamps
    end
  end
end
