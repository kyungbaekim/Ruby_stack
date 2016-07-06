class CreateNinjas < ActiveRecord::Migration
  def change
    create_table :ninjas do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
