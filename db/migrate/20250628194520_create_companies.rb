class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :email 
      t.string :company_name, null: false
      t.string :industry , null: false
      t.string :description , null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
