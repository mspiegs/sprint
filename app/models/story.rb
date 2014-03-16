class Story < ActiveRecord::Base

	acts_as_taggable
	acts_as_taggable_on :tag

	has_many :comments
	belongs_to :project
	belongs_to :sprintblock

	before_save :committed_status
	before_save :remove_committed_sprint

	scope :backlog, -> {where(status: 'backlog')}
	scope :committed, -> {where(status: 'committed')}
	scope :started, -> {where(status: 'started')}
	scope :qa, -> {where(status: 'qa')}

	def committed_status
		project = Project.where(id: self.project_id)
		current_sprint = Sprintblock.current_sprint.where(project_id: project).first
		if self.status == 'committed' && self.sprint_number.nil?
			self.sprint_number = current_sprint.number
		end
	end

	def remove_committed_sprint
		if self.sprint_number? && self.status == 'backlog'
			logger.debug self.sprint_number
			self.sprint_number = nil
		end
	end

end
