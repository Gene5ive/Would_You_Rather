Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root :to => 'questions#index'
  resources :questions do
    member do
      post "like", to: "questions#upvote"
      post "dislike", to:"questions#downvote"
    end
  end
end
