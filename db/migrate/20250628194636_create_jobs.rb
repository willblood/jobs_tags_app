class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :title , null: false
      t.string :description , null: false
      t.string :location , null: false
      t.references :company
      t.timestamps
    end
  end
end
