Rails.application.routes.draw do
  namespace :admin do
    get "/uses"=>"customers#index"
    resources :genres do
        get :search
    end

    resources :items
    resources :evaluation, only: [:index, :destroy]
  end
  scope module: :user do
    root to: "homes#top"
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

    get "/my_page"=>"users#show"
    get "/information/edit"=>"users#edit"
    patch "/information"=>"users#update"
    get "/unsubscribe"=>"users#unsubscribe"
    get '/genre/search' => 'genres#search'
    resources :items, only: [:index, :show]

    #root to: "homes#top"
    root to: redirect('/')
    get "/about"=>"homes#about"
     # 論理削除用のルーティング
    patch  '/withdraw' => 'users#withdraw'
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
