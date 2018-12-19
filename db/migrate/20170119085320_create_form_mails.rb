class CreateFormMails < ActiveRecord::Migration[5.0]
  def change
    create_table :form_mails do |t|
      t.string :code_form, null: false
      t.string :email, null: false
      t.references :domain, foreign_key: true, null: false

      t.timestamps
    end
  end
end
