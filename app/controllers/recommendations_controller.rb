class RecommendationsController < ApplicationController
  layout 'recommendations'
  def show
    @member_id = params[:id]
    render @member_id
  end
end
