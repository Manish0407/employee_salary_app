Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :employees, only: :create
  get 'employee_detail', to: 'employees#employee_detail'
end
