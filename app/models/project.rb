class Project < ActiveRecord::Base
	has_many :stories
	has_many :sprintblocks
	has_and_belongs_to_many :users


	after_save :set_sprint

	def set_sprint
		if Sprintblock.where(project_id: self.id).empty?
			start = self.start_date
			number = self.start_number
			name = "Sprint " + number.to_s
			Sprintblock.create(name: name, number: number, start: start, project_id: self.id)
		end
	end

	def displaycount
		d = [self.backlog_display, self.committed_display, self.qa_display, self.started_display, self.completed_display, self.accepted_display]
		true_count = 0
		d.each do |d|
			if d == true
				true_count += 1
			end
		end
		return true_count
	end
end
