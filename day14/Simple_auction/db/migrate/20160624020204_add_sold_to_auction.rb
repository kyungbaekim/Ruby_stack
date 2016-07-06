class AddSoldToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :sold, :boolean
  end
end
