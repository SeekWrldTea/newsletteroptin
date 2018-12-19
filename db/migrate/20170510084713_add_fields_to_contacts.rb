class AddFieldsToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :job, :string
    add_column :contacts, :address, :string
    add_column :contacts, :recommendation, :string
    add_column :contacts, :cv, :string
    add_column :contacts, :cover_letter, :string
  end
end
