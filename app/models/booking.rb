class Booking < ApplicationRecord
    belongs_to :room
    belongs_to :user
    
    validates :name,:age,:mobile, presence: true
    validates :user_id, presence: true
    validates :start_date, :end_date, presence: true
    validates :start_date, uniqueness: true
    validates :end_date,:room_id, uniqueness: true

    validate :end_date_is_after_start_date
    validate :start_date_is_after_date_today

  private

  def end_date_is_after_start_date
    if self.end_date < self.start_date 
      errors.add(:end_date, 'cannot be before the start date')
    end
  end

   def start_date_is_after_date_today 
     if self.start_date <= Date.today
       errors.add(:start_date, 'cannot be earlier than today')
     end
 end
 
end
