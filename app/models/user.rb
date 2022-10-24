class User < ApplicationRecord
    has_many :teachers, foreign_key:  :user_id, dependent:  :delete_all
    has_many :reservations, foreign_key:  :user_id, dependent:  :delete_all
    
    validate :name, presence: true
end
