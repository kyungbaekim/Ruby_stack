class RemoveLpasswordLender < ActiveRecord::Migration
  def change
    remove_column :lenders, :lpassword
  end
end
