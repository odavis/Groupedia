class AddPrivateToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :privacy, :boolean
  end
end
