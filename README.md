
# README

To install this Ruby on rails project in your local machine 2 simple step to do 
 1.  download it
 2.  run this command in project folder:>  bundle install 


* Configuration

3. Database initialization
    
    
      * Database creation : create your database and access to database.yml to put your own configuration database 
        username: <your_database_username>
        password: <your_database_password>
        host: <your_database_host>

      * generate your tables by running this command in your cmd :> rails db:migrate
      
4. create your admin user by console 
   
   
   * > rails c
   user= User.create("email": <your_email@gmail.com> ,"password": <your_password>,
                                                     "password_confirmation": <your_password>,"isAdmin": true)
   user.save
   
   
5. if everything goes well you can use your api by running > rails server



6. to get your project routes 




*run this command : > rails routes
 
        you should have something like that 

                                                 api_v1_sign_in POST   /api/v1/sign_in(.:format)                                                                api/v1/sessions#create
                                           api_v1_sign_up POST   /api/v1/sign_up(.:format)                                                                api/v1/registrations#create
                                          api_v1_sign_out DELETE /api/v1/sign_out(.:format)                                                               api/v1/sessions#destroy
                                     api_v1_upload_Avatar PUT    /api/v1/upload/Avatar(.:format)                                                          api/v1/sessions#uploadUserAvatar
                                                   api_v1 GET    /api/v1/demandes/user/:page(.:format)                                                    api/v1/demandes#userDemandes
                                                          GET    /api/v1/demandes/admin/encours/:page(.:format)                                           api/v1/demandes#inprocessDemandes
                                                          GET    /api/v1/demandes/admin/valide/:page(.:format)                                            api/v1/demandes#validDemandes
                                          api_v1_demandes POST   /api/v1/demandes(.:format)                                                               api/v1/demandes#create
                                                          PUT    /api/v1/demandes/:id(.:format)                                                           api/v1/demandes#update



* or by going to your routes file in your project app/config/routes.rb


                post "/sign_in", :to => 'sessions#create'
                post "/sign_up", :to => 'registrations#create'
                delete "/sign_out", :to => 'sessions#destroy'
                put "/upload/Avatar", :to => 'sessions#uploadUserAvatar'

                get "/demandes/user/:page", :to => 'demandes#userDemandes'   
                get "/demandes/admin/encours/:page", :to => 'demandes#inprocessDemandes'
                get "/demandes/admin/valide/:page", :to => 'demandes#validDemandes'
                post "/demandes", :to => 'demandes#create'
                put "/demandes/:id", :to => 'demandes#update'



Important ! : fo demandes requests  (create or get demandes) data you should put token and email in headers
              X-User-Token : your_token
              X-User-Email : your_email
              
              
              
              
              

Your Api is ready to use right away 

       


