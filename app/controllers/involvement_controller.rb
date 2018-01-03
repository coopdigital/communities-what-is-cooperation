class InvolvementController < ApplicationController

  before_action :find_submission, :redirect_if_finished

  def show
    @form = InvolvementForm.new
  end

  def update
    @form = InvolvementForm.new(params.require(:submission).to_unsafe_h)
    if @form.valid?
      @submission.update!(@form.attributes)
      if @submission.member.anonymous?
        redirect_to submission_postcode_path(@submission)
      else
        redirect_to submission_distance_path(@submission)
      end
    else
      render :show
    end
  end

end
