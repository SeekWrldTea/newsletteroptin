class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :title, null:false
      t.string :url, null:false
      t.string :image
      t.references :domain, index: true, foreign_key: true

      t.timestamps
    end
  end
end
