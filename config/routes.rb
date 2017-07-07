Rails.application.routes.draw do
  resources :task_lists do
    resources :todos
    get 'share' => 'share_tasks#index'
    post 'share' => 'share_tasks#create'
    put 'share' => 'share_tasks#update'
    delete 'share' => 'share_tasks#delete'
  end
  get 'shared' => 'task_list#shared'
  get 'search/:name' => 'todos#search'
  get 'users' => 'users#index'
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end