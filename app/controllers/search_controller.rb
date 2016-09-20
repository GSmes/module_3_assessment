class SearchController < ApplicationController
  def index
    @stores = Store.find_all(params[:zip])
  end

  def show
    @store = Store.find(params[:id])
  end
end
