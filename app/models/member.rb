class Member < ApplicationRecord
  has_many :submissions

  def anonymous?
    source == 'anonymous'
  end

  def status
    if submissions.finished.any?
      'finished'
    elsif submissions.any?
      'partial'
    else
      'none'
    end
  end

  def to_param
    uuid
  end
end
