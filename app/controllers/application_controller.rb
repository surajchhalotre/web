class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :null_session
  
  
   private
     def logged_in_user
         unless logged_in?
           @current = user.id  
           flash[:danger] = "Please log in."
           redirect_to root_path
         end
     end
 
   
end
