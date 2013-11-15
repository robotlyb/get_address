class Note < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
	belongs_to :user
	default_scope -> {order('created_at DESC')}
	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 140}
	validates :content, presence: true
end
