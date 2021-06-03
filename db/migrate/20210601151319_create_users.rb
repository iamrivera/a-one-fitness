class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :bio, default: 'Please fill me in!'
      t.string :birthday, default: 'Please fill me in!'
      t.integer :height_inches, default: 'Please fill me in!'
      t.integer :weight_pounds, default: 'Please fill me in!'
      t.boolean :is_trainer, default: false
      t.timestamps
    end
  end
end
