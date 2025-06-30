class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows do |t|
      t.references :user
      t.references :company
      t.timestamps
    end
  end
end
