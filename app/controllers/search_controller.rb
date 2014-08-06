class SearchController < ApplicationController

  def index
    if params[:search]
      flickr = FlickRaw::Flickr.new
      @search_results = flickr.photos.search(:text => params[:search], :per_page => 10, :page => params[:page] || 1)
    end
  end

end
