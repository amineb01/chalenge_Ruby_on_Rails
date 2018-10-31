  
     
class Api::V1::DemandesController < ActionController::API
    acts_as_token_authentication_handler_for User
    respond_to :json

    def index 
        _token=request.headers["X-User-Token"]
        _email=request.headers["X-User-Email"]

        user=User.where(authentication_token:_token,email:_email).first

     if(user)

        demandes = Demande.where(user_id:user.id).limit(1).offset(params[:page]).order('created_at DESC')
        render json:{data:demandes, status: 'succes'},status: :ok
    
     else

        head(:unauthorized)     
    
     end 
    end 

    def valide 

        _token=request.headers["X-User-Token"]
        _email=request.headers["X-User-Email"]

        user=User.where(authentication_token:_token,email:_email).first
      if(user)

          if(user.isAdmin)

            p user.isAdmin
             demandes = Demande.joins(:user).select("users.username,demandes.*").where.not(status: nil).limit(1).offset(params[:page]).order('created_at DESC')
           
          else 

            head(:unauthorized)  

          end

        render json:{data:demandes, status: 'succes'},status: :ok

      else

        head(:unauthorized)     
    
     end 
    end 

    def encours 
     

        _token=request.headers["X-User-Token"]
        _email=request.headers["X-User-Email"]

        user=User.where(authentication_token:_token,email:_email).first

     if(user)
     
          if(user.isAdmin)

            p user.isAdmin
             demandes = Demande.joins(:user).select("users.username,demandes.*").where(status: nil).limit(1).offset(params[:page]).order('created_at DESC')
         
          else 

            head(:unauthorized)   

           end

        render json:{data:demandes, status: 'succes'},status: :ok

     else

        head(:unauthorized)     
    
     end 
    end 
    
    
    def create 
         
        _date_debut =request.request_parameters["date_debut"]
        _date_fin =request.request_parameters["date_fin"]
        _raison =request.request_parameters["raison"]

        _token=request.headers["X-User-Token"]
        _email=request.headers["X-User-Email"]

        user=User.where(authentication_token:_token,email:_email).first
    
        if(user)

          demande = Demande.new(user_id: user.id, date_debut: _date_debut, date_fin: _date_fin, raison: _raison)
           if demande.save
            render json:{data:demande, status: 'succes'},status: :ok
           else
            render json:{data:demande, status: 'fail'}

        end

        else
          head(:unauthorized)     
    
        end 
    end     

    def update 
        action =request.request_parameters["action"]
       
        _token=request.headers["X-User-Token"]
        _email=request.headers["X-User-Email"]
        p params[:id]

        user=User.where(authentication_token:_token,email:_email).first
   
        if(user)

            if(user.isAdmin)
                demande = Demande.find(params[:id])
                    if(demande)
                    demande = Demande.find(params[:id])
                    demande.update(status: action)
                    render json:{data:"demande", status: 'succes'},status: :ok
                    else
                    render json:{data:"demande", status: 'fail'},status: :ok
            end

            else
                head(:unauthorized)     
            end
        else
          head(:unauthorized)     
    
     end 
    end   
  end
       #david = User.find_by(name: 'David')

       #user = User.find_by(name: 'David')
       #user.update(name: 'Dave')

