class DistanceController < ApplicationController

  before_action :find_submission, :redirect_if_finished

  def show
    @form = DistanceForm.new(distance: 20)
    @postcode = @submission.member.postcode
  end

  def update
    @form = DistanceForm.new(params.require(:submission).to_unsafe_h)
    if @form.valid?
      @submission.update!(@form.attributes)
      redirect_to submission_activities_path(@submission)
    else
      render :show
    end
  end

end
