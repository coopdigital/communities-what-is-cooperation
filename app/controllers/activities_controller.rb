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
      @submission.update!(finished: true)
      redirect_to submission_path(@submission)
    else
      @interests = @submission.interests
      render :show
    end
  end

  private

  def find_submission
    @submission = Submission.find_by!(uuid: params[:submission_id])
  end

end
