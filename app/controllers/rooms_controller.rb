class RoomsController < ApplicationController
before_action :set_room, only: [:show, :edit, :update, :destroy]

    def index 
     
      @rooms = Room.all
    end 

    def new
      @room = Room.new
    end 

    def create
      @room = Room.new(room_params)
      if @room.save
        redirect_to rooms_path
      else 
        render :new
      end
    end

    def update
        if @room.update(room_params)
            redirect_to rooms_path
        else 
            render :edit_room_path
        end 
    end
                            
    def destroy

      if @room.destroy
     
          redirect_to rooms_path
      end 
    end 
 
  private
    def room_params
      params.require(:room).permit(:room_num, :room_type, :price, :image)
    end

    def set_room
      @room = Room.find_by_id(params[:id])
    end
end 