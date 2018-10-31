class AddUserIdToDemandes < ActiveRecord::Migration[5.2]
  def change
    add_column :demandes, :user_id, :integer
  end
end
