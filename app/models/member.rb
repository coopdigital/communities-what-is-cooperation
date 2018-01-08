class Member < ApplicationRecord
  has_many :submissions

  scope :with_final_submission, ->{ joins(:submissions).merge(Submission.final) }

  geocoded_by :geocoding_address
  after_validation :geocode, if: ->(obj){ obj.postcode.present? && obj.postcode_changed? }

  def anonymous?
    source != 'admin'
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

  def geocoding_address
    if postcode.blank?
      nil
    else
      "#{postcode}, UK"
    end
  end

  def to_param
    uuid
  end
end
