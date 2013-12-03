class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :user_id
      t.integer :years_old
      t.integer :min_weight
      t.integer :max_weight
      t.integer :min_height
      t.integer :max_height
      t.integer :score
      t.string :clothes_url
      t.string :pants_url
      t.string :shoes_url
      t.string :other_dress_url
      t.integer :min_price
      t.integer :max_price

      t.timestamps
    end
  end
end
