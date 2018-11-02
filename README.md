# README


        post "/sign_in", :to => 'sessions#create'
        post "/sign_up", :to => 'registrations#create'
        delete "/sign_out", :to => 'sessions#destroy'
        put "/upload/Avatar", :to => 'sessions#uploadUserAvatar'

        get "/demandes/user/:page", :to => 'demandes#userDemandes'
        get "/demandes/admin/encours/:page", :to => 'demandes#inprocessDemandes'
        get "/demandes/admin/valide/:page", :to => 'demandes#validDemandes'
        post "/demandes", :to => 'demandes#create'
        put "/demandes/:id", :to => 'demandes#update'

       
                 api_v1_sign_in POST   /api/v1/sign_in(.:format)                                                                api/v1/sessions#create
           api_v1_sign_up POST   /api/v1/sign_up(.:format)                                                                api/v1/registrations#create
          api_v1_sign_out DELETE /api/v1/sign_out(.:format)                                                               api/v1/sessions#destroy
     api_v1_upload_Avatar PUT    /api/v1/upload/Avatar(.:format)                                                          api/v1/sessions#uploadUserAvatar
                   api_v1 GET    /api/v1/demandes/user/:page(.:format)                                                    api/v1/demandes#userDemandes
                          GET    /api/v1/demandes/admin/encours/:page(.:format)                                           api/v1/demandes#inprocessDemandes
                          GET    /api/v1/demandes/admin/valide/:page(.:format)                                            api/v1/demandes#validDemandes
          api_v1_demandes POST   /api/v1/demandes(.:format)                                                               api/v1/demandes#create
                          PUT    /api/v1/demandes/:id(.:format)                                                           api/v1/demandes#update

