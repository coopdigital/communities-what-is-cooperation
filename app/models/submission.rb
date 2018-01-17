class Submission < ApplicationRecord
  belongs_to :member
  has_many :interests
  has_many :yes_activities, -> { where("interests.response" => 'yes')}, through: :interests, :source => :activity

  scope :by_created, ->{ order('created_at ASC')}
  scope :finished, ->{ where(finished: true) }
  scope :final, ->{ where(final: true) }

  accepts_nested_attributes_for :interests

  def to_param
    uuid
  end
end
