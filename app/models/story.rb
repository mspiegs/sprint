class Story < ActiveRecord::Base

	has_many :comments

	scope :backlog, -> {where(status: 'backlog')}
	scope :committed, -> {where(status: 'committed')}
	scope :started, -> {where(status: 'started')}
	scope :qa, -> {where(status: 'qa')}

end
