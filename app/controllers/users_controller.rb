class UsersController < ApplicationController
    before_action :set_user, only: %i[:show, :edit, :update, :destroy]
    layout false
    after_action :send_welcome_email

def index
  @users = User.all
  UserMailer.welcome.deliver_now
  
end

    def new
      @user = User.new
    end
  
    def create
      
      @user = User.new(user_params)
      if @user.save
        UserMailer.welcome.deliver_now
        session[:user_id] = @user.id  
        redirect_to sessions_path(@user)
      else 
        render :new
      end
    end
  
    def show

    end
  
    def edit
      if !logged_in? || !@user
        redirect_to show_user_path
      end
    end
        
    def update
      if @user
        @user.update(user_params)
        redirct_to show_user_path
   
      end
    end
  
    def destroy
     if  @user.destroy
      redirect_to root_path
     end 
    end
  
    private

    def send_welcome_email
      UserMailer.welcome(self).deliver_now  
  end
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end
  
    def set_user
      @user = User.find_by_id(params[:id])
    end
end
