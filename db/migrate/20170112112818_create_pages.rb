class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title, null:false
      t.text :body, null:false
      t.string :slug, null:false
      t.references :seo, index: true, foreign_key: true
      t.references :domain, index: true, foreign_key: true

      t.timestamps
    end
  end
end
