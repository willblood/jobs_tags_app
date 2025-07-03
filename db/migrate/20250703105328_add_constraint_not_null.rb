class AddConstraintNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users , :email , false
    change_column_null :companies, :email, false
    change_column_null :users, :password_digest, false
    change_column_null :companies, :password_digest, false
    change_column_null :jobs, :company_id, false
    change_column_null :follows, :user_id, false
    change_column_null :follows, :company_id, false
  end
end
