class StoriesController < ApplicationController
  def new
    @story = Story.new
  end

  def create
    @story = Story.new params[:story].permit(:title, :link, :user)
  
    if @story.save
      redirect_to stories_path
    else
      render 'new'
    end
  end

  def index
    @stories = Story.all
  end

end
