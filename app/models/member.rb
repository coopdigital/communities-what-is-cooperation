class Member < ApplicationRecord
  has_many :submissions

  def to_param
    uuid
  end
end
