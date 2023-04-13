class BookingsController < ApplicationController
  before_action :set_booking, only: [:index,:destroy]
  before_action :set_room, only: [:create, :new]
   
  def index
    @bookings = Booking.all 
  end 

    def new
     @booking = Booking.new
    end
        
    def create
      
    @booking = Booking.new(booking_params)
        if @booking.save 
             
        redirect_to bookings_path
        
        else
          render :new
        
      end
    end


    def destroy
      if @booking.destroy
        
      redirect_to bookings_path
      end 
    end

     def payment
     end

    private

    def booking_params
      
      params.require(:booking).permit(:name, :mobile, :age, :start_date, :end_date, :user_id, :room_id)
    end
    
    def set_booking
      @booking = Booking.find_by_id(params[:id])
    end

    def set_room
      @room = Room.find_by_id(params[:room_id])
    end
    
end

