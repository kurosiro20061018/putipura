Rails.application.routes.draw do
  namespace :admin do
    get "/uses"=>"customers#index"
    resources :genres, only: [:index, :edit, :update]
    post "/genres"=>"genres#create"
    resources :items, only: [:index, :new,:show, :edit, :update]
    post "/items"=>"items#create"
    #get "/admin"=>"homes#top"
    get ""=>"homes#top"
  end

  namespace :user do
    resources :evaluations, only: [:new, :show, :edit, :destroy]
    get "/my_page"=>"customers#show"
    get "/information/edit"=>"customers#edit"
    get "/information"=>"customers#updeate"
    get "/unsubscribe"=>"customers#unsubscribe"
    get "/withdrawal"=>"customers#withdrawal"
    resources :items, only: [:index, :show]

    root to: "homes#top"
    get "/about"=>"homes#about"
end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :user, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
