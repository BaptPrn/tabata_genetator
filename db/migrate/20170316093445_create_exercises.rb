class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :type
      t.string :equipment, default: "Aucun"
      t.integer :initial_status
      t.integer :available
      t.timestamps
    end
  end
end
