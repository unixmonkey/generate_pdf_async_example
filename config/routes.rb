Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :issues do
    collection do
      get :issue835
    end
  end
end
