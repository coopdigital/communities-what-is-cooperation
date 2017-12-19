class Submission < ApplicationRecord
  belongs_to :member

  scope :by_created, ->{ order('created_at ASC')}

  def to_param
    uuid
  end
end
