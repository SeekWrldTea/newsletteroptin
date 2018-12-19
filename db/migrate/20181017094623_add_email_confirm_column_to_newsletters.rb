class AddEmailConfirmColumnToNewsletters < ActiveRecord::Migration[5.0]
  def change
    add_column :Newsletters, :email_confirmed, :boolean, :default => false
    add_column :Newsletters, :confirm_token, :string
  end
end
