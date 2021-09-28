class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :role_name
      t.timestamps
    end
    # Default roles at first account initializer 
    Role.create!(:role_name => "user")
    Role.create!(:role_name => "moderator")
    Role.create!(:role_name => "admin")
  end
end
