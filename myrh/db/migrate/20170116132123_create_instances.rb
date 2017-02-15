class CreateInstances < ActiveRecord::Migration[5.0]
  def change
    create_table :instances do |t|
      t.integer :id_instance
      t.integer :year
      t.integer :month
      t.integer :id_survey
      t.timestamps
    end
  end
end
