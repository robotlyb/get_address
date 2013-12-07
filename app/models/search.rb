class Search < ActiveRecord::Base
   attr_accessible :user_id, :key
	 validates :user_id, presence: true
	 validates :key, presence: true
		belongs_to :user
end
