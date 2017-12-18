class DistanceForm
  include ActiveModel::Model

  TRANSPORT_OPTIONS = ['walk', 'by bike', 'by bus', 'drive']

  attr_accessor :distance, :distance_mode

  validates :distance, :distance_mode, presence: true
  validates :distance, numericality: {greater_than: 0}
  validates :distance_mode, inclusion: {in: TRANSPORT_OPTIONS}

  def attributes
    {distance: distance, distance_mode: distance_mode}
  end

  def transport_options
    TRANSPORT_OPTIONS
  end
end
