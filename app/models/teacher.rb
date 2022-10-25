class Teacher < ApplicationRecord
    has_many :reservations, foreign_key:  :teacher_id, dependent:  :delete_all
    # has_one_attached :photo

    validates :name, :title, :photo, presence: true
end
