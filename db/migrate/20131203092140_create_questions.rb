class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :situation
      t.string :gender
      t.integer :min_weight
      t.integer :max_weight
      t.integer :min_height
      t.integer :max_height
      t.integer :min_price
      t.integer :max_price
      t.string :color

      t.timestamps
    end
  end
end
