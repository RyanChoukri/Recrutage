class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :json
      t.integer :id_survey
      t.integer :id_user
      t.timestamps
    end
  end
end
