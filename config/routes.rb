Rails.application.routes.draw do
  devise_for :users
  get 'welcome',to: 'static_pages#welcome',as: 'welcome'
  get 'about',to: 'static_pages#about',as: 'about'
  root to: redirect('/welcome',status: 302)
  post 'contact',to: 'static_pages#leave_feedback',as: 'leave_feedback'
  get 'contact',to:'static_pages#leave_feedback'

  #get 'mc_questions',to: 'mc_questions#index',as: 'mc_questions' #index
  #get 'mc_questions/new',to: 'mc_questions#new',as: 'new_mc_question' #new
  get 'mc_questions/:id',to: 'mc_questions#show',as: 'mc_question' #show
  #post 'mc_questions',to: 'mc_questions#create' #create
  get 'mc_questions/:id/edit',to: 'mc_questions#edit',as:'edit_mc_question' #edit
  patch 'mc_questions/:id',to: 'mc_questions#update' #update
  delete 'mc_questions/:id',to: 'mc_questions#destroy' #destroy

  get 'quizzes',to: 'quizzes#index',as: 'quizzes'
  get 'quizzes/:id',to: 'quizzes#show', as: 'quiz'
  get 'quizzes/:id/edit',to: 'quizzes#edit',as: 'edit_quiz'
  patch 'quizzes/:id', to: 'quizzes#update'
  delete 'quizzes/:id',to: 'quizzes#destroy'

  get 'quizzes/:id/mc_questions', to: 'quiz_mc_questions#index',as: 'quiz_mc_questions'
  get 'quizzes/:id/mc_questions/new', to: 'quiz_mc_questions#new',as: 'new_quiz_mc_question'
  post 'quizzes/:id/mc_questions', to: 'quiz_mc_questions#create'

  get 'account/quizzes',to: 'account_quizzes#index',as: 'account_quizzes'
  get 'account/quizzes/new', to: 'account_quizzes#new', as: 'new_account_quiz'
  post 'account/quizzes', to: 'account_quizzes#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
