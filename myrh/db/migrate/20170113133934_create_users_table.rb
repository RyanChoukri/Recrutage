class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :name
      t.string :lastname
      t.string :email
      t.integer :id_instance
      t.date :birthdate
      t.string :status
      t.timestamps
    end
  end
end
