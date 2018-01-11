class RecommendationsTestController < ApplicationController
  layout 'recommendations'
  def show
    @member_id = params[:id]
    @disable_analytics = true
    render "recommendations/#{@member_id}"
  end
end
