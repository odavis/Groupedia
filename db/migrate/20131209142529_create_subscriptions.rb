class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :customerid
      t.string :account
      t.references :user

      t.timestamps
    end
  end
end
