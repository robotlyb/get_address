class Question < ActiveRecord::Base
  attr_accessible :color, :gender, :max_height, :max_price, :max_weight, :min_height, :min_price, :min_weight, :situation, :user_id, :other_description, :intro, :visit, :years_old
validates :intro, presence: true
	belongs_to :user
	default_scope -> { order('created_at DESC')}
	validates :user_id, presence: true
	has_many :answers
	before_create :create_token
	def Question.new_token
		SecureRandom.urlsafe_base64
	end

	def Question.encrypt(token)
			Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_token
			self.token = Question.encrypt(Question.new_token)
		end
end
