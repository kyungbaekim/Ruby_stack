class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :product_name
      t.text :description
      t.float :start_bid
      t.float :reserve_price
      t.date :end_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
