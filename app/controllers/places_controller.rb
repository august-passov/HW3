class PlacesController < ApplicationController
  def index
  # find all places and render /places view 
  @places = Place.all
  end

  def show
  # find a place
  @place = Place.find_by({"id" => params["id"]})
  @posts = Post.where({"place_id" => @place["id"]})
  # render a places/show view with details about places
end 

  def new
  @place = Place.new
  # render view with new place form
  end

  def create
  # start with a new place
  @place = Place.new

  # collect user-entered data in table columns
  @place["name"] = params["place"]["name"]
  
  @place.save

  redirect_to "/places"

  end

  
end
