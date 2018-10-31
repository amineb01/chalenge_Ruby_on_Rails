class AddIsAdminToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column("users","isAdmin",:boolean, :default => false)
   end
  
  def down
    remove_column("users","isAdmin")
  end
end
