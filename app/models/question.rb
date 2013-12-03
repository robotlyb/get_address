class Question < ActiveRecord::Base
  attr_accessible :color, :gender, :max_height, :max_price, :max_weight, :min_height, :min_price, :min_weight, :situation, :user_id
end
