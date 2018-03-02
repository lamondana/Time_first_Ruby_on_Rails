class Teacher < ApplicationRecord
  has_one :classroom

  def full_name
    "#{first_name} #{last_name}"
  end
end
