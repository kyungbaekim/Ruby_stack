class CreateLenders < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.string :lfirst_name
      t.string :llast_name
      t.string :lemail
      t.string :lpassword_digest
      t.integer :lmoney

      t.timestamps null: false
    end
  end
end
