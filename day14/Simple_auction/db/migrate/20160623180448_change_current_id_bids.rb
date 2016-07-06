class ChangeCurrentIdBids < ActiveRecord::Migration
  def change
    remove_column :bids, :current_id
    add_column :bids, :bid, :float
  end
end
