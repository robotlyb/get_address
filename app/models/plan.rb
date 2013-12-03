class Plan < ActiveRecord::Base
  attr_accessible :clothes_url, :max_height, :max_price, :max_weight, :min_height, :min_price, :min_weight, :other_dress_url, :pants_url, :score, :shoes_url, :user_id, :years_old
end
