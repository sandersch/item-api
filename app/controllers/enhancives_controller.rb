class EnhancivesController < ApplicationController
  before_action :set_enhancife, only: [:show, :update, :destroy]

  # GET /enhancives
  def index
    @enhancives = Enhancive.all

    render json: @enhancives
  end

  # GET /enhancives/1
  def show
    render json: @enhancife
  end

  # POST /enhancives
  def create
    @enhancife = Enhancive.new(enhancife_params)

    if @enhancife.save
      render json: @enhancife, status: :created, location: @enhancife
    else
      render json: @enhancife.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enhancives/1
  def update
    if @enhancife.update(enhancife_params)
      render json: @enhancife
    else
      render json: @enhancife.errors, status: :unprocessable_entity
    end
  end

  # DELETE /enhancives/1
  def destroy
    @enhancife.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enhancife
      @enhancife = Enhancive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enhancife_params
      params.require(:enhancife).permit(:references{item}, :persists, :rechargeable)
    end
end
