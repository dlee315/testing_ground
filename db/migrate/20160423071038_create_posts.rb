class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.reference :user

      t.timestamps null: false
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
