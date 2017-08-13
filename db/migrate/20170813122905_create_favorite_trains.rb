class CreateFavoriteTrains < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_trains do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end
end
