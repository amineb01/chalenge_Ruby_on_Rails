Rails.application.routes.draw do

  devise_for :users , defaults: { format: :json }
  namespace :api do
    namespace :v1 do
      devise_scope :user do

        post "/sign_in", :to => 'sessions#create'
        post "/sign_up", :to => 'registrations#create'
        delete "/sign_out", :to => 'sessions#destroy'
        put "/upload/Avatar", :to => 'sessions#uploadUserAvatar'

        get "/demandes/user/:page", :to => 'demandes#userDemandes'
        get "/demandes/admin/encours/:page", :to => 'demandes#inprocessDemandes'
        get "/demandes/admin/valide/:page", :to => 'demandes#validDemandes'
        post "/demandes", :to => 'demandes#create'
        put "/demandes/:id", :to => 'demandes#update'

       
       
      end
    end
  end
end

