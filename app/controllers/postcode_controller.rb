class PostcodeController < ApplicationController

  before_action :find_submission, :redirect_if_finished, :check_anonymous

  def show
    @form = PostcodeForm.new(postcode: @submission.member.postcode)
  end

  def update
    @form = PostcodeForm.new(params.require(:submission).to_unsafe_h)
    if @form.valid?
      @submission.member.update!(postcode: @form.postcode)
      redirect_to submission_distance_path(@submission)
    else
      render :show
    end
  end

  private

  def check_anonymous
    redirect_to submission_distance_path if !@submission.member.anonymous?
  end
end
