Rails.application.routes.draw do
  namespace :admin do
    get "/uses"=>"customers#index"
    resources :genres
    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    end
    resources :evaluation, only: [:index, :destroy]
  end

  namespace :user do
    resources :items do
      resources :evaluations, only: [:new, :create, :index,  :update]
    end
    #resources :users do
      #collection do
        #get :delete
        #get :search
      #end
    #end

    get "/my_page"=>"customers#show"
    get "/information/edit"=>"customers#edit"
    patch "/information"=>"customers#update"
    get "/unsubscribe"=>"customers#unsubscribe"
    get "/withdrawal"=>"customers#withdrawal"
    resources :items, only: [:index, :show]

    root to: "homes#top"
    get "/about"=>"homes#about"
  end
  devise_for :user, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
