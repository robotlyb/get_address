class Comment < ActiveRecord::Base
  attr_accessible :content, :plan_id, :user_id
end
