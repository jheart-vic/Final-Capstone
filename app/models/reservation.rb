class Reservation < ApplicationRecord   
    belongs_to :teacher, class_name: 'Teacher'
    belongs_to :user, class_name: 'User'

    validates :reservation_date, :city, presence: true
end
