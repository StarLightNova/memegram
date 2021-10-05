class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id,  null: false
      t.integer :category_id, null: false
      t.string  :title
      t.string  :body,    null: false
      t.timestamps
    end

    add_foreign_key :posts, :users
    add_foreign_key :posts, :categories

    # This code will generate random posts in the program.
    for i in 0..20
      Post.create! do |p|
        p.user_id         = User.order('RANDOM()').first.id
        p.category_id     = Category.order('RANDOM()').first.id
        p.body            = Faker::Lorem.paragraph(sentence_count: 0..10, supplemental: false, random_sentences_to_add: 20)
        p.title           = Faker::Boolean.boolean == true ? Faker::Game.title : nil
      end
    end
  end
end
