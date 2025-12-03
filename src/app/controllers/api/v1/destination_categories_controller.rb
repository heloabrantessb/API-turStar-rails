class Api::V1::DestinationCategoriesController < ApplicationController
  before_action :set_destination_category, only: %i[ show update destroy ]

  # GET /destination_categories
  def index
    @destination_categories = DestinationCategory.all

    render json: @destination_categories
  end

  # GET /destination_categories/1
  def show
    render json: @destination_category
  end

  # POST /destination_categories
  def create
    @destination_category = DestinationCategory.new(destination_category_params)

    if @destination_category.save
      render json: @destination_category, status: :created, location: @destination_category
    else
      render json: @destination_category.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /destination_categories/1
  def update
    if @destination_category.update(destination_category_params)
      render json: @destination_category
    else
      render json: @destination_category.errors, status: :unprocessable_content
    end
  end

  # DELETE /destination_categories/1
  def destroy
    @destination_category.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination_category
      @destination_category = DestinationCategory.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def destination_category_params
      params.expect(destination_category: [ :destination_id, :category_id ])
    end
end
