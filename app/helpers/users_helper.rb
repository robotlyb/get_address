module UsersHelper
	def gravatar_for(user, options = { size: 50 })
		gravatar_id =	Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
		image_tag(gravatar_url,alt: user.name, class: "gravatar")
	end
	def visit_user(user)
		user.visit = 1
		user.save
		self.visited_user = user
	end
	def visited_user=(user)
		@visit_user = user
	end

	def visited_user 
		token = 1
		@user ||= User.find_by_visit(token)
	end

	def end_visit(user)
		user.visit = 0
		user.save
	end

	def rewrite_user_flag
		if(visited_user)
			end_visit visited_user
		end
	end
end
