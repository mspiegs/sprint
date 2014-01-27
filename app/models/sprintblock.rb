class Sprintblock < ActiveRecord::Base
	has_many :stories
	belongs_to :project

	before_save :set_sprint_end


	scope :current_sprint, -> {where("start < ? AND end > ?", Time.now, Time.now)}


	def set_sprint_end
		project = set_project
		logger.debug project
		sprintlength = project.sprint_length
		logger.debug sprintlength
		start = self.start
		enddate = start + sprintlength.weeks - 1.day
		self.end = enddate
	end

	def next_sprint
		project = set_project
		length = project.sprint_length
		if Sprintblock.where(project_id: project.id).empty?
			number = project.start_number
			next_start = project.start_date
		else
			number = self.number + 1
			next_start = self.end + 1.second
		end
		name = "Sprint " + number.to_s
		Sprintblock.create(name: name, number: number, start: next_start, project_id: project.id)
	end

	def get_project
		Project.where(id: self.project_id).first
	end

	def set_project
		sprintproject = self.get_project
	end

	

	def sprint_number
		number = Sprintblock.last.number + 1
		self.number = number
		self.name = "Sprint " + number.to_s
	end

end
