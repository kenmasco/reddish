class StoriesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  def new
    @story = Story.new
  end

  def create
    @story = Story.new params[:story].permit(:title, :link)
    @story.user = current_user
  
    if @story.save
      redirect_to stories_path
    else
      render 'new'
    end
  end

  def index
    @stories = Story.all
  end

  def edit
    @story = Story.find params[:id]
  end

  def update
    @story = Story.find params[:id]
    @story.update params[:story].permit(:title, :link)
    redirect_to '/stories'
  end

  def destroy
    @story = Story.find params[:id]
    @story.delete
    redirect_to '/stories'
  end

end
