json.extract! task, :id, :name, :description, :deadline, :priority, :completed, :created_at, :updated_at
json.url task_url(task, format: :json)
