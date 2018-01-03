class PagesController < ApplicationController

  def index
    redirect_to new_member_path
  end

  def show
    render params[:id]
  end
end
