class Comment < ActiveRecord::Base
  attr_accessible :content, :plan_id, :user_id, :score
	belongs_to :plan
	default_scope->{order('created_at DESC')}
	validates :user_id, presence: true
	validates :plan_id, presence: true
	validates :content, presence: true
	validates :score, presence: true
	belongs_to :user
end
