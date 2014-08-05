class SearchController < ApplicationController

  def index
    if params[:search]
      flickr = FlickRaw::Flickr.new
      @search_results = flickr.photos.search({:text => params[:search]})
    end
  end

end