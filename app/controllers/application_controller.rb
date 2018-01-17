class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :track_source

  private

  def redirect_if_finished
    if @submission.finished?
      redirect_to page_path(:thanks)
    end
  end

  def find_submission
    @submission = Submission.find_by!(uuid: params[:submission_id])
  end

  def track_source
    cookies[:source] = params[:source] if !params[:source].blank?
  end

end
