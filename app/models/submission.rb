class Submission < ApplicationRecord
  belongs_to :member
  has_many :interests

  scope :by_created, ->{ order('created_at ASC')}
  scope :finished, ->{ where(finished: true) }

  accepts_nested_attributes_for :interests

  def to_param
    uuid
  end
end
