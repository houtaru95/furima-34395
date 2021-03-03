class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :find_item, only: [:index, :create]
  before_action :confirm_user, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
  end


  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:postal_code, :shipping_place_id, :city, :address, :building_name, :tell_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def confirm_user
    redirect_to(root_path) if current_user.id == @item.user_id
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

end
