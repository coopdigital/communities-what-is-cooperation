class ThisThatsForm
  include ActiveModel::Model

  attr_accessor :this_1

  validates :this_1, presence: true

  def attributes
    {this_1: this_1}
  end
end
