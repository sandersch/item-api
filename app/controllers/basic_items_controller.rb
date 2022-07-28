class BasicItemsController < ApplicationController
  before_action :set_basic_item, only: [:show, :update, :destroy]

  # GET /basic_items
  def index
    @basic_items = BasicItem.all

    render json: @basic_items
  end

  # GET /basic_items/1
  def show
    render json: @basic_item
  end

  # POST /basic_items
  def create
    @basic_item = BasicItem.new(basic_item_params)

    if @basic_item.save
      render json: @basic_item, status: :created, location: @basic_item
    else
      render json: @basic_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /basic_items/1
  def update
    if @basic_item.update(basic_item_params)
      render json: @basic_item
    else
      render json: @basic_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /basic_items/1
  def destroy
    @basic_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_item
      @basic_item = BasicItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def basic_item_params
      params.require(:basic_item).permit(:worn, :weight_capacity, :count_capacity, :kind)
    end
end
