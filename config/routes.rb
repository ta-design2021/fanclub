Rails.application.routes.draw do
  devise_for :users

  get 'top/index'
  # トップページにアクセスしたときのルート
  root "top#index"
  # マイページに遷移するルート
end
