Rails.application.routes.draw do
  devise_for :admins,controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users,controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  omniauth_callbacks: 'users/omniauth_callbacks'
}

  #管理者側
  namespace :admins do
    resources :tags, only:[:index,:new,:create,:edit,:update,:destroy]
    resources :categories, only:[:index,:new,:create,:edit,:update,:destroy]
    resources :comics, only:[:index, :show, :new, :create, :edit, :update, :destroy]
    resources :informations, only:[:index, :show, :new, :create, :edit, :update, :destroy]
    resources :users, only:[:index, :show, :edit, :update] do
      collection do #全体データにアクション
        get :csv_download, defaults: { format: 'csv'} #デフォルト形式をCSVに設定
      end
    end
  end
  post '/admins/comics/new' => 'admins/comics#create'
  patch '/admins/comics/:id/edit' => 'admins/comics#update'
  post '/admins/tags/new' => 'admins/tags#create'
  patch '/admins/tags/:id/edit' => 'admins/tags#update'
  post '/admins/categories/new' => 'admins/categories#create'
  patch '/admins/categories/:id/edit' => 'admins/categories#update'
  patch '/admins/users/:id/edit' => 'admins/users#update'
  post '/admins/informations/new' => 'admins/informations#create'
  patch '/admins/informations/:id/edit' => 'admins/informations#update'

 #ユーザ側
  scope '(:locale)',locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
  root 'homes#top'
  get 'homes/top'
  get 'homes/about'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only:[:create, :destroy]
  resources :comics, only:[:index, :show, :update] do
    resources :clips, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy]
    resources :bookmarks, only:[:create, :destroy]
  end
  resources :notifications, only:[:index]
  delete 'notifications/destroy_all' => 'notifications#destroy_all'
  resources :informations, only:[:index, :show]
  get 'comics/ranking' => 'comics#ranking', as: 'ranking'
  get 'users/:id/clip_index' => 'clips#clip_index', as: 'clip_index'

  #退会処理(論理削除)のルーティング
  put 'users/:id/hide' => 'users#hide', as: 'hide'
  patch 'users/:id/hide' => 'users#hide'
  get 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw'

  #検索
  get '/search' => 'searches#search'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
