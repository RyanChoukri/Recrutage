class CreateBuisinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :buisinesses do |t|
      t.string :name
      t.string :city

      t.timestamps
    end
  end
end
