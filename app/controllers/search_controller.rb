class SearchController < ApplicationController
  def index
    @results = Store.find(params[:zip])
  end
end
