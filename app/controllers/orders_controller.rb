class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :no_seller, only: [:index]

  def index
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def form_params
    params.require(:form).permit(:postcode, :area_id, :municipality, :address, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段 @item.price
        card: form_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def no_seller
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

# def form_params
#   params.require(:form).permit(:postcode, :area_id, :municipality, :address, :building_name, :tel, :order_id, :item_id).merge(user_id: current_user.id)
# end