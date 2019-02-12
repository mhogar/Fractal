class TaskTrackerStory < ApplicationRecord
	belongs_to :project, class_name: "TaskTrackerProject"
	has_many :tasks, class_name: "TaskTrackerTask", foreign_key: "story_id"
end