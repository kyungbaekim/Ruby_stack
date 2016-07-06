class RemoveLpasswordLender2 < ActiveRecord::Migration
  def change
    remove_column :lenders, :lpassword_digest
  end
end
