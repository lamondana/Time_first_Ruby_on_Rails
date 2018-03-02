class Classroom < ApplicationRecord
  has_many :pupils
  has_many :actuals, through: :pupils
  belongs_to :teacher
end
