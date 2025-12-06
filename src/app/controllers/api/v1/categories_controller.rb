class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show update destroy ]

  # GET /categories
  def index
    @categories = Category.all

    render json: @categories
  end

  # GET /categories/1
  def show
    render json: @category
  end

  # POST /categories
  def create
    authorize @category
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /categories/1
  def update
    authorize @category
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_content
    end
  end

  # DELETE /categories/1
  def destroy
    authorize @category
    @category.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.expect(category: [ :title ])
    end
end
