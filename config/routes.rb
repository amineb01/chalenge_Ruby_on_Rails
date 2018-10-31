Rails.application.routes.draw do

  devise_for :users , defaults: { format: :json }
  namespace :api do
    namespace :v1 do
      resources :demandes  
      devise_scope :user do

        get "/demandes/user/:page", :to => 'demandes#index'
        get "/demandes/admin/encours/:page", :to => 'demandes#encours'
        get "/demandes/admin/valide/:page", :to => 'demandes#valide'
        post "/demandes", :to => 'demandes#create'
        put "/demandes/:id", :to => 'demandes#update'

        
        put "/upload/Avatar", :to => 'sessions#uploadUserAvatar'
        post "/sign_in", :to => 'sessions#create'
        post "/sign_up", :to => 'registrations#create'
        delete "/sign_out", :to => 'sessions#destroy'
      end
    end
  end
end

 