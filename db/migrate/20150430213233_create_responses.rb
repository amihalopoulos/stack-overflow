class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :content, null: false
      t.references :user
      t.references :responsible, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
