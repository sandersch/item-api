class ResistancesController < ApplicationController
  before_action :set_resistance, only: [:show, :update, :destroy]

  # GET /resistances
  def index
    @resistances = Resistance.all

    render json: @resistances
  end

  # GET /resistances/1
  def show
    render json: @resistance
  end

  # POST /resistances
  def create
    @resistance = Resistance.new(resistance_params)

    if @resistance.save
      render json: @resistance, status: :created, location: @resistance
    else
      render json: @resistance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resistances/1
  def update
    if @resistance.update(resistance_params)
      render json: @resistance
    else
      render json: @resistance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resistances/1
  def destroy
    @resistance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resistance
      @resistance = Resistance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resistance_params
      params.require(:resistance).permit(:item_id, :kind, :amount, :temporary)
    end
end
