Rails.application.routes.draw do
  # creates a 'sessions' and 'registrations' controller for handling
  # user sign up, sign in, editing, etc
  devise_for :users

  # 'show' will be a user's profile with their badges, drills, etc
  # 'index' will be the leaderboard
  resources :users, only: [:index, :show]

  # # /categories  = a list of all the categories
  # # /categories/ruby = a list of all the drill groups in that category
  resources :categories do
    resources :drill_groups, only: [:show]
  end

  resources :drill_groups, except: [:show]

  resources :drills do
    resources :solutions
    resources :answers
    resources :selected_drills
  end

  resources :achivements
  resources :user_achievements


  # resources :categories
  #
  # resources :drill_groups do # /drill_groups/ruby-arrays-part-1
  #   resources :drills, only: [:show] # /drill_groups/ruby-arrays-part-1/drill-1
  # end
  #
  # resources :drills do
  #   resources :answers
  #   resources :solutions
  # end
  #
  # resources :users, only: [:show] do
  #   resources :user_achievements, only: [:create]
  # end
  #
  # resources :achievements




end
