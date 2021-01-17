class OrdersController < ApplicationController

  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(form_params)
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def form_params
    params.require(:form).permit(:postcode, :area_id, :municipality, :address, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

# def form_params
#   params.require(:form).permit(:postcode, :area_id, :municipality, :address, :building_name, :tel, :order_id, :item_id).merge(user_id: current_user.id)
# end