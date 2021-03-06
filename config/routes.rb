Rails.application.routes.draw do
 
 devise_for :users
 root to: "homes#top" #root to:はサイトのルートページを決める記述になります。
 #/にアクセスした場合、今まで以下のような rails のデフォルトの画面でしたが、この設定をすることで自分の作成したページに設定できます。
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 get "/homes/about" => "homes#about", as: "about"#Aboutページの作成
 resources :post_images, only: [:new, :create, :index, :show, :destroy] do
 resource :favorites, only: [:create, :destroy]
 resources :post_comments, only: [:create, :destroy]
 
end
 resources :users, only: [:show, :edit, :update]
end