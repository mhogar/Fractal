Rails.application.routes.draw do
  resources :task_tracker
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
