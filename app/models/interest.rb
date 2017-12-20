class Interest < ApplicationRecord
  belongs_to :activity
  belongs_to :submission

  validates :activity, :submission, :response, :position, presence: true
end
