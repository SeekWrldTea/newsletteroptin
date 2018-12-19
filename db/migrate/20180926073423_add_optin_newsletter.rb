class AddOptinNewsletter < ActiveRecord::Migration[5.0]
  def change
    add_column :newsletters, :confirm, :datetime
    add_column :newsletters, :cancel, :datetime
  end
end
