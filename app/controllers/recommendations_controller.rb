class RecommendationsController < ApplicationController
  layout 'recommendations'
  def show
    @member = Member.find_by_uuid(params[:id])
    render @member.uuid
  end
end
