class Api::V1::SessionsController < Devise::SessionsController

    def create
        user=User.where(email:params[:email]).first
        if user&.valid_password?(params[:password])
            render json: user.as_json(only: [:id, :email, :authentication_token]),status: :created
        else
           head(:unauthorized)     
      end 
      end
    
      def destroy
        user = User.where(:email => params[:user_login][:email])
        user.authentication_token = nil
        user.save
        render :json=> {:success=>true}
      end
    
    end