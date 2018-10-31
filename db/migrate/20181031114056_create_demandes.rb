class CreateDemandes < ActiveRecord::Migration[5.2]
  def change
    create_table :demandes do |t|
      t.date :date_debut, :null=>false
      t.date :date_fin, :null=>false
      t.string :raison, :null=>false
      t.boolean :status

      t.timestamps
    end
  end
end
