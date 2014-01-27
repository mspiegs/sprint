class Project < ActiveRecord::Base
	has_many :stories
	has_many :sprintblocks

	after_save :set_sprint

	def set_sprint
		if self.start_number_changed? && Sprintblock.where(project_id: self.id).empty?
			start = self.start_date
			number = self.start_number
			name = "Sprint " + number.to_s
			Sprintblock.create(name: name, number: number, start: start, project_id: self.id)
		end
	end
end
