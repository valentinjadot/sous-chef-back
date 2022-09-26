class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  before_action :create_next_window_orders, only: [:index, :show]
  skip_before_action :verify_authenticity_token

  # GET /orders
  def index
    @orders = Order.includes(:user).joins(:user).order('orders.execution_date')
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def create_next_window_orders
    CreateNextWindowOrders.for
  end

  # Only allow a trusted parameter "white list" through.
  def order_params
    params.require(:order).permit(:user_id, :vegan, :take_away, :active)
  end
end
