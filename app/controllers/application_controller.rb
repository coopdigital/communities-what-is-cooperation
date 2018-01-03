class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def redirect_if_finished
    if @submission.finished?
      redirect_to submission_path(@submission)
    end
  end

  def find_submission
    @submission = Submission.find_by!(uuid: params[:submission_id])
  end

end
