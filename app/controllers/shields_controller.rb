class ShieldsController < ApplicationController
  before_action :set_shield, only: [:show, :update, :destroy]

  # GET /shields
  def index
    @shields = Shield.all

    render json: @shields
  end

  # GET /shields/1
  def show
    render json: @shield
  end

  # POST /shields
  def create
    @shield = Shield.new(shield_params)

    if @shield.save
      render json: @shield, status: :created, location: @shield
    else
      render json: @shield.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shields/1
  def update
    if @shield.update(shield_params)
      render json: @shield
    else
      render json: @shield.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shields/1
  def destroy
    @shield.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shield
      @shield = Shield.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shield_params
      params.require(:shield).permit(:size)
    end
end
