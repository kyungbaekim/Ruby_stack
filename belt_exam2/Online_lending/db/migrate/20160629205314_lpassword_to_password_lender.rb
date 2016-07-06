class LpasswordToPasswordLender < ActiveRecord::Migration
  def change
    remove_column :lenders, :password
    add_column :lenders, :password_digest, :string
  end
end
