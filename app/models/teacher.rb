class Teacher < ApplicationRecord
    has_many :reservations, foreign_key:  :teacher_id, dependent:  :delete_all

    belongs_to :users
end
