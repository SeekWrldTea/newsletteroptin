class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :code, null:false

      t.timestamps
    end
  end
end
