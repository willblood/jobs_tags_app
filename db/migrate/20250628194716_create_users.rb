class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name ,null: false
      t.string :last_name, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
