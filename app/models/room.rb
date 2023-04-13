class Room < ApplicationRecord
    has_one_attached :image
    has_one :booking
    validates :room_num,  uniqueness: true, presence: true
    validates :room_type, presence: true
    validates :price, presence: true
       

                                                                                                                                                                                                                                        
    

end
