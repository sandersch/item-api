class ArmorBasesController < ApplicationController
  before_action :set_armor_basis, only: [:show, :update, :destroy]

  # GET /armor_bases
  def index
    @armor_bases = ArmorBase.all

    render json: @armor_bases
  end

  # GET /armor_bases/1
  def show
    render json: @armor_basis
  end

  # POST /armor_bases
  def create
    @armor_basis = ArmorBase.new(armor_basis_params)

    if @armor_basis.save
      render json: @armor_basis, status: :created, location: @armor_basis
    else
      render json: @armor_basis.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /armor_bases/1
  def update
    if @armor_basis.update(armor_basis_params)
      render json: @armor_basis
    else
      render json: @armor_basis.errors, status: :unprocessable_entity
    end
  end

  # DELETE /armor_bases/1
  def destroy
    @armor_basis.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_armor_basis
      @armor_basis = ArmorBase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def armor_basis_params
      params.fetch(:armor_basis, {})
    end
end
