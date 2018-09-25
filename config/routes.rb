Rails.application.routes.draw do
  get 'guests/new'
  get 'guests/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Page Navigation
  
  get 'favicon', to: 'navpages#favicon'
  
  root to: 'navpages#index', as: 'welcome'

  get '/history', to: 'navpages#history', as: 'history'

  get '/contact', to: 'navpages#contact', as: 'contact'

  get '/help', to: 'navpages#help', as: 'help'
  
  get '/news', to: 'navpages#news', as: 'news'
  
  get '/services', to: 'navpages#services', as: 'services'

  get '/services/develop', to: 'navpages#develop', as: 'develop'
  
  get '/services/design', to: 'navpages#design', as: 'design'
  
  get '/services/consult', to: 'navpages#consult', as: 'consult'
  
  get '/new', to: 'guests#new'
  
  # post '/reqinfo', to: 'navpages#reqinfo'
  
  post '/new', to: 'guests#make', as: 'reqinfo'
  
end