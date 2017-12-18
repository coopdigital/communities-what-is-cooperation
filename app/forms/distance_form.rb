class DistanceForm
  include ActiveModel::Model

  attr_accessor :distance, :distance_mode

  validates :distance, :distance_mode, presence: true

  def attributes
    {distance: distance, distance_mode: distance_mode}
  end
end
