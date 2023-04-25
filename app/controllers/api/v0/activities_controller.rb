class class Api::V0::ActivitiesController < ApplicationController
  def index 
    location = params[:location]
    forecast = ActivityFacade.current_weather(location)
    activities = ActivityFacade.get_activities(location)
    render json: ActivitySerializer.new(activities)
  end
end