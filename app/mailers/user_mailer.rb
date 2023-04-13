class UserMailer < ApplicationMailer
  before_action :set_user
  def welcome
    
    @user = user
    mail to: user
  end
end

private

 def set_user
 @user = User.find_by_id(:user_id)
end 


