module CommentsHelper
	def set_story
		@story = Story.find(params[:story_id])
	end
end
