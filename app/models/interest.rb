class Interest < ApplicationRecord
  belongs_to :activity
  belongs_to :submission

  scope :by_position, -> { order('position ASC') }

  validates :activity, :submission, :response, :position, presence: true

  def response_emoji
    case response
    when 'yes' then '👍'
    when 'no' then '👎'
    else '🙈'
    end
  end

end
