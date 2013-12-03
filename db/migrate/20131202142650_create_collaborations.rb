class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.string :email
      t.string :role
      t.references :user
      t.references :wiki
      t.timestamps
    end
  add_index :collaborations, :user_id

  end
end