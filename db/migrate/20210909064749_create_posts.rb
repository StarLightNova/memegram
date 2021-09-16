class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string  :title
      t.string  :body,    null: false
      t.timestamps
    end

    add_foreign_key :posts, :users
  end
end
