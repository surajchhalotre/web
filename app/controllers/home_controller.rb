class HomeController < ApplicationController
    def index
        UserMailer.welcome.deliver_now
        # @current_user = current_user
    end
end
