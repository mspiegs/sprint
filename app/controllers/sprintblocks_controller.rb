class SprintblocksController < ApplicationController

	before_action :set_sprintblock, only: [ :show, :index, :next_sprint]

	def new
		@sprintblock = Sprintblock.new
		@story = Story.new
	end

	def show
		@story = Story.new
	end

	def create
		@sprintblock = Sprintblock.new(sprintblock_params)
		respond_to do |format|
			if @sprintblock.save
				format.html { redirect_to sprintblock_path(@sprintblock), notice: "Sprint successfully added"}
			end
		end
	end



	private

		def set_sprintblock
			@sprintblock = Sprintblock.find(params[:id])
		end

		def sprintblock_params
			params.require(:sprintblock).permit(:name, :start, :end, :number, :project_id)
		end
end