class LocationsController < ApplicationController
  respond_to :json

  def index
    respond_with locations: collection
  end

  def show
    respond_with location: resource
  end

  private

  def begin_of_chain
    params[:category_id] ? Category.find_by_id(params[:category_id]).locations : Location
  end

  def collection
    begin_of_chain.order(:title).all
  end

  def resource
    begin_of_chain.find_by_id!(params[:id])
  end

end
