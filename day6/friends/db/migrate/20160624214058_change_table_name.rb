class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :friends, :users
  end
end
