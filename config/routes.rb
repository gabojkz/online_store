Rails.application.routes.draw do
  root 'products#index'

  resources :products do
    collection do
      get 'buy'
    end
  end

end
