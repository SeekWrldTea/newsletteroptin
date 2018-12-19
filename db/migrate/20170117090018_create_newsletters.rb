class CreateNewsletters < ActiveRecord::Migration[5.0]
  def change
    create_table :newsletters do |t|
      t.string :email, null: false
      t.references :domain, foreign_key: true, null: false

      t.timestamps
    end
  end
end
