class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :title , null: false
      t.references :job
      t.timestamps
    end
  end
end
