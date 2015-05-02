class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :voteable, polymorphic: true, index: true
      t.timestamps null: false
    end
    add_index :votes, [:voteable_id, :voteable_type, :user_id], :unique => true
  end
end
