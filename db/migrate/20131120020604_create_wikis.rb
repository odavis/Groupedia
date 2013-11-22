class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :topic
      t.text :description
      t.references :user

      t.timestamps
    end
    add_index :wikis, :user_id
  end
end
