class CreateMenuAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_associations do |t|
      t.references :menu, index: true, foreign_key: true
      t.references :page, index: true, foreign_key: true
      t.references :link, index: true, foreign_key: true
      t.string :ancestry, index: true
      t.integer :position

      t.timestamps
    end
  end
end
