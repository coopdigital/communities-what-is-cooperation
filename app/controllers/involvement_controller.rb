class InvolvementController < ApplicationController

  before_action :find_submission, :redirect_if_finished

  def show
    @form = InvolvementForm.new
  end

  def update
    @form = InvolvementForm.new(params.require(:submission).to_unsafe_h)
    if @form.valid?
      @submission.update!(@form.attributes)
      redirect_to submission_distance_path(@submission)
    else
      render :show
    end
  end

  private

  def find_submission
    @submission = Submission.find_by!(uuid: params[:submission_id])
  end
end
