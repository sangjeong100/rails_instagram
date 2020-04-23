Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index' 

  resources :posts do
    member do
      post :toggle_like
    end
  end

  resources :comments do
  end

  scope module: :front do
  namespace :my do
    resources :passwords, only: [:edit, :update]  #비밀번호 변경 기능
    resources  :resigns, only: [:edit, :destroy]    #회원 탈퇴기능
  end
  end

end
