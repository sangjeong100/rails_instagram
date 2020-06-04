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

  resources :users, only: [:index ,:show] do
    member do
      post :toggle_follow
    end

  end
  

  scope module: :front do
    scope module: :users do
      resources :follow_relationships, only: [:create, :destroy] #팔로우/언팔로우시 처리로직 (화면설계 5에 해당)
    end
    scope module: :users do
      resources :top,       only: [:index], as: "top", path: "" # 프로필 페이지TOP(화면설계 1,3,4에해당)
      resources :followers,  only: [:index] # Follower일람 페이지(화면설계 2에해당)
      resources :followings, only: [:index] # Following일람 페이지(화면설계 2에해당)
    end

    namespace :my do
      resources :passwords, only: [:edit, :update]  #비밀번호 변경 기능
      resources  :resigns, only: [:edit, :destroy]    #회원 탈퇴기능
    end

  end

end
