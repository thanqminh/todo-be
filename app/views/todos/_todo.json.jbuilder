json.extract! todo, :id, :name, :done, :task_list_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
