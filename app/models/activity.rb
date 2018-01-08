class Activity < ApplicationRecord
  has_many :interests
  has_many :submissions, through: :interests
  has_many :members, through: :submissions

  scope :active, -> { where(active: true) }
  scope :with_thumbs_up, -> { joins(:interests).where(interests: {response: 'yes'}).group('activities.id')}
  scope :with_thumbs_down, -> { joins(:interests).where(interests: {response: 'no'}).group('activities.id')}
  scope :with_final_submission, ->{ joins(:submissions).merge(Submission.final) }
end
