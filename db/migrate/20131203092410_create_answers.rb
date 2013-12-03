class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.boolean :flag
      t.string :clothes_url
      t.string :pants_url
      t.string :shoes_url
      t.string :other_dress

      t.timestamps
    end
  end
end
