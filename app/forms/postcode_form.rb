class PostcodeForm
  include ActiveModel::Model

  attr_accessor :postcode

  validates :postcode, presence: true, length: {minimum: 5}

end
