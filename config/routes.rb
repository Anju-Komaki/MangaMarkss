Rails.application.routes.draw do
  devise_for :admins,controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users,controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  #管理者側
  namespace :admins do
    resources :comics, only:[:index, :show, :new, :create, :edit, :update, :destroy]
    resources :users, only:[:index, :show] do
      collection do #全体データにアクション
        get :csv_download, defaults: { format: 'csv'} #デフォルト形式をCSVに設定
      end
    end
  end
  post '/admins/comics/new' => 'admins/comics#create'
  patch '/admins/comics/:id/edit' => 'admins/comics#update'

 #ユーザ側
  root 'homes#top'
  get 'homes/top'
  get 'homes/about'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only:[:create, :destroy]
  resources :comics, only:[:index, :show] do
    resources :comments, only:[:create, :destroy]
    resources :bookmarks, only:[:create, :destroy]
  end
  resources :notifications, only:[:index]
  delete 'notifications/destroy_all' => 'notifications#destroy_all'

  #退会処理(論理削除)のルーティング
  put 'hide' => 'users#hide'
  patch 'hide' => 'users#hide'
  get 'withdraw' => 'users#withdraw'

  #検索
  get '/search' => 'searches#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
