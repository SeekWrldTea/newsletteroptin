class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :published_at, null: false
      t.boolean :is_published, null: false, default: false
      t.references :domain, foreign_key: true, null: false
      t.string :slug, index: {unique: true}

      t.timestamps
    end
  end
end
