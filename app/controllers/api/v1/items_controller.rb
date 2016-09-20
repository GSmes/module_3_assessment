class Api::V1::ItemsController < Api::ApiController
  def index
    respond_with Item.all
  end

  def show
  end

  def create
  end

  def destroy
  end
end
