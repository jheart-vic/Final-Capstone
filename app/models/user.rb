class User < ApplicationRecord
    has_many :teachers, foreign_key:  :teacher_id, dependent:  :delete_all
    has_many :reservations, foreign_key:  :reservation_id, dependent:  :delete_all
end
