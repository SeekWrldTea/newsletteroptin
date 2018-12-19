class AddDomainToProperty < ActiveRecord::Migration[5.0]
  def change
    add_reference :properties, :domain, foreign_key: true, null: false, default: 1
  end
end
