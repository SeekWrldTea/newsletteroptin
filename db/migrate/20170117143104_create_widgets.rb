class CreateWidgets < ActiveRecord::Migration[5.0]
  def change
    create_table :widgets do |t|
      t.string :title, null: false
      t.string :subtitle, null: false
      t.string :icon, null: false
      t.string :url_text, null: false
      t.string :url, null: false
      t.references :domain, foreign_key: true, null: false

      t.timestamps
    end
  end
end
