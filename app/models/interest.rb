class Interest < ApplicationRecord
  belongs_to :activity
  belongs_to :submission

  scope :by_position, -> { order('position ASC') }

  scope :thumbs_up, -> { where(response: 'yes') }
  scope :thumbs_down, -> { where(response: 'no') }
  scope :unseen, -> { where(response: 'unseen') }
  scope :with_final_submission, ->{ joins(:submission).where('submissions.final' => true)}

  validates :activity, :submission, :response, :position, presence: true

  def response_emoji
    case response
    when 'yes' then '👍'
    when 'no' then '👎'
    else '🙈'
    end
  end

end
