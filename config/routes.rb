Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/reviewers', to: 'reviewers#index'
  get '/reviewers/next', to: 'reviewers#next'
  post '/reviewers/advance', to: 'reviewers#advance'
  get '/app', to: 'static#root'
end
