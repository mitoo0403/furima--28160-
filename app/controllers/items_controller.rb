class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

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

#   def destroy
#     item = Item.find(params[:id])re12
#     Item.destroy
#   end

#   def edit
#   end

#   def update
#     item = Items.find(params[:id])
#     tweet.update(tweet_params)
#   end

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

end