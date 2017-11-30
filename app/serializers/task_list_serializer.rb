class TaskListSerializer < ApplicationSerializer
  attributes :id, :name, :is_write, :share_count, :todo_count, :done_count
end