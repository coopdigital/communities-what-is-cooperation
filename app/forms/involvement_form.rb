class InvolvementForm
  include ActiveModel::Model

  attr_accessor :involvement

  def attributes
    {involvement: involvement}
  end
end
