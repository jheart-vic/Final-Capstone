class Teacher < ApplicationRecord
    has_many :reservations, foreign_key:  :teacher_id, dependent:  :delete_all

    belongs_to :user, class_name: 'User', foreign_key: :user_id

    validates :name, :title, presence: true
end
