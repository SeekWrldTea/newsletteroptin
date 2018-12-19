class CreatePageWidgets < ActiveRecord::Migration[5.0]
  def change
    create_table :page_widgets do |t|
      t.references :page, foreign_key: true, null: false
      t.references :widget, foreign_key: true, null: false

      t.timestamps
    end
  end
end
