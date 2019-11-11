class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:show, :submit, :cancel, :close, :destroy, :edit, :reject]
  before_action :set_open_purchase, only: [:create]

  def create
  	if (@order = @purchase.orders.where(item_id: order_params[:item_id]).any?)
		  redirect_to action: "edit", id: @purchase.id
    else
      @purchase.orders.create(item_id: order_params[:item_id], quantity: order_params[:quantity], purchase_id: @purchase.id,
      totalPrice: (order_params[:quantity].to_i * (Item.find(order_params[:item_id]).price.to_f)))
      redirect_to action: "show", id: @purchase.id
    end
    #redirect_to action: "edit", id: @purchase.id
  end

  def update
    @purchase = Purchase.find(params[:id])
    i=0    
    @purchase.orders.each do |order|
      order.update(quantity: purchase_params[:quantity][i],
        totalPrice: purchase_params[:quantity][i].to_i *
        Item.find(order.item_id).price.to_f)
      i =+ 1
    end
    @purchase.update(:orders => @purchase.orders)
    respond_to do |format|
      format.html { redirect_to @purchase, notice: 'Purchase was successfully edited.' }
      format.json { render :show, status: :ok, location: @purchase }
    end
  end

  def edit
  end

  def index
    @purchases = current_user.purchases
    if current_user.role? :admin
      @purchases = index_all
    end
  end

  def show
  end

  def destroy
    Purchase.find(@purchase.id).delete
    redirect_to action: "index"
  end

  def submit
    @purchase.status = 'pending'
    @purchase.save
    redirect_to action: "show", id: @purchase.id
  end

  def cancel
    @purchase.status = 'cancelled'
    @purchase.save
    redirect_to action: "show", id: @purchase.id
  end

  def reject
    @purchase.status = 'rejected'
    @purchase.save
    redirect_to action: "show", id: @purchase.id
  end

  def close
    @purchase.status = 'completed'
    @purchase.save
    redirect_to action: "show", id: @purchase.id
  end

  private

    def index_all
      @purchases = Purchase.all
    end  

    def set_open_purchase
     	@purchase = Purchase.where(user_id: current_user.id, status: 'open')[0]
      if(@purchase==nil)
        @purchase = Purchase.create(user_id: current_user.id, status: 'open')
      end
    end

    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:quantity => [])
    end

    def order_params
      params.permit(:item_id,:quantity)
    end

end