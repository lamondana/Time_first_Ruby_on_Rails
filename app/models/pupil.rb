class Pupil < ApplicationRecord

  belongs_to :classroom
  scope :sorted, lambda {order("first_name ASC")}
  has_many :actual
end
