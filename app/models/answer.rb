class Answer < ActiveRecord::Base
  attr_accessible :clothes_url, :flag, :other_dress, :pants_url, :question_id, :shoes_url, :user_id
	validates :user_id, presence: true
	validates :question_id, presence: true
	belongs_to :user
	belongs_to :question
	default_scope -> {order('created_at DESC')}
end
