json.array!(@project_stats) do |stats|
	json.extract! stats, :id, :name, :description, :num_stories, :num_tasks, :total_time_estiamte, :completed_time_estimate, :created_date, :updated_date
	#json.url task_tracker_project_url(stats, format: :json)
end