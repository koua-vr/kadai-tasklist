Rails.application.routes.draw do
  # トップページ(タスクリスト一覧）
  root to: 'tasks#index'

  # ログイン
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # 新規ユーザ登録用
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]

  # resourcesを利用
  resources :tasks
  
  # 以下を実装
  # # CRUD
  # get    'tasks/:id', to: 'tasks#show'
  # post   'tasks',     to: 'tasks#create'
  # put    'tasks/:id', to: 'tasks#update'
  # delete 'tasks/:id', to: 'tasks#destroy'

  # # index: show の補助ページ
  # get 'tasks', to: 'tasks#index'

  # # new: 新規作成用のフォームページ
  # get 'tasks/new', to: 'tasks#new'

  # # edit: 更新用のフォームページ
  # get 'tasks/:id/edit', to: 'tasks#edit'
  
end
