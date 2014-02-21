class SessionsController < Devise::SessionsController
	def new
		@story = Story.new
	end


end