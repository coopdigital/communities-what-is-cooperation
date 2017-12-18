class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def redirect_if_finished
    if @submission.finished?
      redirect_to submissions_path(@submission)
    end
  end
end
