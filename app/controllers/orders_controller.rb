class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:new]

  def new

  end

  def index
    @orders = current_user.purchases.where(status:'open')[0].orders
  end   

  def show
    
  end

  private

    def set_order
      @item = Item.find(params[:id])
      @order = Order.new()
    end

end