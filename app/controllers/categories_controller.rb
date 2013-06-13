class CategoriesController < ApplicationController
  respond_to :json

  def index
    respond_with categories: collection
  end

  def show
    respond_with category: resource
  end

  private

  def collection
    Category.order(:title).all
  end

  def resource
    Category.find_by_id!(params[:id])
  end

end
