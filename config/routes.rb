Rails.application.routes.draw do
  resources :comments
  resources :users
  get 'welcome/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'welcome#home'

get 'about', to: 'welcome#about'


get 'articles/new', to: 'articles#new'  , as: 'new_article'

post 'articles/new', to: 'articles#create'

get 'articles/:id', to: 'articles#show' , as: 'article'

get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'


patch 'articles/:id/', to: 'articles#update'


get 'articles' , to: 'articles#index'


delete 'articles/:id/', to: 'articles#destroy'


# resources :articles

end
