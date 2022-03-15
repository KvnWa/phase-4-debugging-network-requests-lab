class ToysController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toys.create!(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)
    render json: toy
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

  def render_not_found_response
    render json: { error: "Toy not found" }, status: :not_found_response
  end

end
