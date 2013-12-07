class Plan < ActiveRecord::Base
  attr_accessible :clothes_url, :max_height, :max_price, :max_weight, :min_height, :min_price, :min_weight, :other_dress_url, :pants_url, :score, :shoes_url, :user_id, :years_old, :title, :color, :situation, :visit, :key, :gender
	validates_presence_of :user_id, :title, :on => :create
	default_scope->{ order('created_at DESC')}
	has_many :comments
	belongs_to :user
end
