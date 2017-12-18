class DistanceController < ApplicationController

  before_action :find_submission, :redirect_if_finished

  def show
    @form = DistanceForm.new
  end

  def update
    @form = DistanceForm.new(params.require(:submission).to_unsafe_h)
    if @form.valid?
      @submission.update!(@form.attributes)
      redirect_to submission_this_that_path(@submission)
    else
      render :show
    end
  end

  private

  def find_submission
    @submission = Submission.find_by!(uuid: params[:submission_id])
  end
end
