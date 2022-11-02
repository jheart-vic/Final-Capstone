class Teacher < ApplicationRecord
  has_many :reservations, foreign_key: :teacher_id, dependent: :delete_all

  validates :name, :title, :bio, :work_experience, presence: true
end
