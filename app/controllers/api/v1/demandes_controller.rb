  
     
class Api::V1::DemandesController < ActionController::API
    acts_as_token_authentication_handler_for User
    respond_to :json

    def index 
        demandes = Demande.order('created_at DESC')
        render json:{data:demandes, status: 'succes'},status: :ok
    end    
  end
       