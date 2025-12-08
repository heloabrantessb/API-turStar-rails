class Api::V1::DestinationsController < ApplicationController
  before_action :set_destination, only: %i[ show update destroy ]

  # GET /destinations
  def index

    @destinations = policy_scope(Destination)
    authorize @destinations

    render json: @destinations
  end

  # GET /destinations/1
  def show
    authorize @destination
    render json: @destination
  end

  # POST /destinations
  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      render json: @destination, status: :created 
    else
      render json: @destination.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /destinations/1
  def update
    if @destination.update(destination_params)
      render json: @destination
    else
      render json: @destination.errors, status: :unprocessable_content
    end
  end

  # DELETE /destinations/1
  def destroy
    @destination.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def destination_params
      params.expect(destination: [ :title, :description, :base_price, :country ])
    end
end
