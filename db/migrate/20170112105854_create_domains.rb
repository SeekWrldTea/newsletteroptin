class CreateDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :domains do |t|
      t.string :title, null:false
      t.string :code, null:false

      t.timestamps
    end
  end
end
