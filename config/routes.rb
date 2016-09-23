Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/reviewers', to: 'reviewers#index'
  get '/reviewers/next', to: 'reviewers#next'
  get '/reviewers/next_single', to: 'reviewers#next_single'
  post '/reviewers/advance', to: 'reviewers#advance'
  post '/reviewers/advance_single', to: 'reviewers#advance_single'
  get '/', to: 'static#root'
end
