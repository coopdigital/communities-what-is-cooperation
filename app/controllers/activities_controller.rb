class ActivitiesController < ApplicationController

  before_action :find_submission, :redirect_if_finished

  def show
    activities = Activity.active.to_a.shuffle
    @interests = activities.each_with_index.map do |activity, position|
      @submission.interests.build(activity: activity, position: position, response: 'unseen')
    end
  end

  def update
    if @submission.update(params.require(:submission).permit(interests_attributes: [:activity_id, :position, :response]))
      redirect_to new_submission_activities_path(@submission)
    else
      @interests = @submission.interests
      render :show
    end
  end

  def new
    @required_interests = 5
    @ups = @submission.interests.thumbs_up.count
    @downs = @submission.interests.thumbs_down.count
    @unseens = @submission.interests.unseen.count
  end

  def create
    @submission.update!(activity_suggestion: params[:suggestion], finished: true, final: true)
    redirect_to page_path(:thanks)
  end

end
