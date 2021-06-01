class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :bio
      t.string :birthday
      t.integer :height_inches
      t.integer :weight_pounds
      t.boolean :is_trainer, default: false
      t.timestamps
    end
  end
end
