class InvolvementForm
  include ActiveModel::Model

  attr_accessor :involvement

  validates :involvement, presence: true

  def attributes
    {involvement: involvement}
  end
end
