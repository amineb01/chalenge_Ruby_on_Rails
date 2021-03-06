class Api::V1::SessionsController < Devise::SessionsController

    def create
        
        user=User.where(email:params[:email]).first
       
        if user&.valid_password?(params[:password])
            render json: user.as_json(only: [:id,:avatar, :email, :authentication_token, :isAdmin]),status: :created
        else
            render json:{data:"Invalid Email Or Password", status: 'fail'},status: :ok
        end 
    end
    
    def destroy
        user = User.where(:email => params[:user_login][:email])
        user.authentication_token = nil
        user.save
        render :json=> {:success=>true}
    end

    def uploadUserAvatar
        _token=request.headers["X-User-Token"]
        _email=request.headers["X-User-Email"]

        user=User.where(authentication_token:_token,email:_email).first
        if(user)
            p user
            user.avatar = params[:file] # Assign a file like this, or
            user.save
            render json:{data:user.avatar, status: 'succes'},status: :ok

        else
            head(:unauthorized)  
        end
    end    
end