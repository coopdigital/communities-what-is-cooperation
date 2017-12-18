class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def redirect_if_finished
    if @submission.finished?
      redirect_to submission_path(@submission)
    end
  end
end
