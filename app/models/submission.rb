class Submission < ApplicationRecord
  belongs_to :member

  def to_param
    uuid
  end
end
