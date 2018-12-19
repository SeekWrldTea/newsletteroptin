class AddEmailConfirmColumnToNewsletters < ActiveRecord::Migration[5.0]
  def change
    add_column :newsletters, :email_confirmed, :boolean, :default => false
    add_column :newsletters, :confirm_token, :string
  end
end
