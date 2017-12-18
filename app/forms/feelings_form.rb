class FeelingsForm
  include ActiveModel::Model

  attr_accessor :feelings_1

  validates :feelings_1, presence: true

  def attributes
    {feelings_1: feelings_1}
  end
end
