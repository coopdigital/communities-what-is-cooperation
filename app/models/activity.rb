class Activity < ApplicationRecord
  has_many :interests
  scope :active, -> { where(active: true) }
  scope :with_thumbs_up, -> { joins(:interests).where(interests: {response: 'yes'}).group('activities.id')}
  scope :with_thumbs_down, -> { joins(:interests).where(interests: {response: 'no'}).group('activities.id')}
end
