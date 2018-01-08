module Admin
  class ActivitiesController < AdminController

    def show
      @activity = Activity.find(params[:id])
      @interested_members = @activity.members.merge(Interest.thumbs_up).where('submissions.final' => true)
    end
  end
end

