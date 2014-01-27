class VotesController < ApplicationController

  def create
    @story = Story.find(params[:story_id])
    Vote.create(up: params[:up], story: @story, user: current_user)

    redirect_to '/stories'
  end
end