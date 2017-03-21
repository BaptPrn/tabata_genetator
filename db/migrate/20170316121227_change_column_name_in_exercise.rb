class ChangeColumnNameInExercise < ActiveRecord::Migration[5.0]
  def change
    rename_column :exercises, :type, :exercise_type
  end
end
