class CreateUserWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_workouts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
