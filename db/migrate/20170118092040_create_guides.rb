class CreateGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :guides do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :page, foreign_key: true, null: false

      t.timestamps
    end
  end
end
