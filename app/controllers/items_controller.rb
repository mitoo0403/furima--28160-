class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :item_find, only: [:edit, :update, :destroy, :show]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end
    
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if @item.user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy(item_params)
      redirect_to root_path
    else
      render :show
    end
  end

  def show
  end

#   def show
#     @comment = Comment.new
#     @comments = @item.comments.includes(:user)
#   end

#   def search
#     @items = Item.search(params[:keyword])
#   end

  private

  # def set_item
  #   @item = Item.find(params[:id]) 
  # end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_free_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

end