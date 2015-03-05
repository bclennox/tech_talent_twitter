class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id, index: true, null: false
      t.integer :following_id, index: true, null: false
    end
    add_foreign_key :follows, :users
    add_foreign_key :follows, :users, column: :following_id
  end
end
