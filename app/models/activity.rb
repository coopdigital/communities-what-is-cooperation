class Activity < ApplicationRecord
  scope :active, -> { where(active: true) }
end
