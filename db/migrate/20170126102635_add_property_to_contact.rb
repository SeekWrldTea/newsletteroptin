class AddPropertyToContact < ActiveRecord::Migration[5.0]
  def change
    add_reference :contacts, :property, foreign_key: true
  end
end
