class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order("created_at desc").where(recipient_id: current_user, owner_type: "User")
    @myacts = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user, owner_type: "User")
  end

  #def destroy
   # @activity = PublicActivity::Activity.find(params[:id])
   # if @activity.destroy
    #  redirect_to activities_url
    #end
  #end 
end
