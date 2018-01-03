class Member < ApplicationRecord
  has_many :submissions

  def anonymous?
    source == 'anonymous'
  end

  def to_param
    uuid
  end
end
