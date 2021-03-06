class User < ActiveRecord::Base
	before_save {self.email = email.downcase}
	before_create :create_remember_token 
	attr_accessible :email, :name, :password, :password_digest, :password_confirmation, :visit
	validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true,
										format: { with: VALID_EMAIL_REGEX},
										uniqueness: { case_sensitive: false}
	validates :password, length: { minimum: 6}
	has_secure_password
	has_many :questions
	has_many :answers
	has_many :plans
	has_many :comments
	has_many :searches
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

end
