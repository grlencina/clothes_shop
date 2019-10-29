class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:add_to_cart]
  before_action :set_item, only: [:add]

  def add_to_cart
  	if (@purchase.orders.where(item_id: order_params[:item_id]).count > 0 )
		  
    else
      @order = Order.create(item_id: order_params[:item_id], quantity: order_params[:quantity], purchase_id: @purchase.id,
        totalPrice: order_params[:quantity] * Item.find(order_params[:item_id]).price)

    end
  end

  def add
    @order = Order.new()
  end

  def index
    @purchases = Purchase.all
  end   

  def show
    
  end

  private

    def set_purchase
     	@purchase = Purchase.where(user_id: current_user.id, status: 'open')[0]
      if(@purchase==nil)
        @purchase = Purchase.create(user_id: current_user.id, status: 'open')
      end
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
     	params.require(:item).permit(:id, :name, :description, :stock, :price)
    end

    def order_params
      params.require(:order).permit(:item_id,:quantity)
    end

end