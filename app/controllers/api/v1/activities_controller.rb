# frozen_string_literal: true

class Api::V1::ActivitiesController < Api::V1::BaseController
  before_action :authenticate_user
  before_action :set_activity, only: %i[show update destroy]

  def index
    activities = current_user.activities
    json_response(activities)
  end

  def create
    activity = current_user.activities.create!(activity_params)
    json_response(activity, :created)
  end

  def show
    json_response(@activity)
  end

  def update
    @activity.update(activity_params)
    head :no_content
  end

  def destroy
    @activity.destroy
    head :no_content
  end

  private

  def activity_params
    params.permit(:name, :description, :track, :track_image)
  end

  def set_activity
    @activity = current_user.activities.find(params[:id])
  end
end
