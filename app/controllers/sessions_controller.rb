class SessionsController < ApplicationController
  layout false 
   before_action :set_current_user
   
    def create
      
    user = User.find_by(email: params[:email])
	   if user.present?
      
      if user.password == params[:password] && user.email == params[:email]
       redirect_to home_index_path    
       UserMailer.welcome.deliver_now
	     session[:user_id] = user.id
	     flash[:success] = 'login successfull'
	     
	    else
	      flash.now[:error] = 'Invalid email/password combination'
	      render :new
	    end  
    end
  end 


    def destroy
      
      if session.destroy
        session[:user_id] = nil   
        redirect_to sessions_path 
      end
    end



    private

     def set_current_user
       @current_user = User.find_by_id(session[:user_id])
    end

        
end
