class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :category_name, null: false
      t.string :category_description, null: true
      t.timestamps
    end

    # Initialize first categories
    Category.create!(:category_name => "Classic")
    Category.create!(:category_name => "Anime")
    Category.create!(:category_name => "Trolling")
    Category.create!(:category_name => "Abuse")
    Category.create!(:category_name => "Animals")
    Category.create!(:category_name => "Fantasy")
    Category.create!(:category_name => "BM")
    Category.create!(:category_name => "Games")
  end
end
