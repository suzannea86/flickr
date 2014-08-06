class SearchController < ApplicationController

  def index
  end

  def search
    if params[:search].present?
      flickr = FlickRaw::Flickr.new
      @search_results = flickr.photos.search(:text => params[:search], :per_page => 10, :page => params[:page] || 1)
    else
      redirect_to(root_path, flash: {alert: "Please enter a valid search text"})
    end
  end

end
