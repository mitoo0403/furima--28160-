require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it "商品名と説明、カテゴリーと状態、配送料、発送地域、発送までの日数、価格が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明が空では登録できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーが選択されていなければ登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "商品の状態が選択されていなければ登録できない" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end
      it "配送料の負担が選択されていなければ登録できない" do
        @item.delivery_free_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery free must be other than 0")
      end
      it "発送元の地域が選択されていなければ登録できない" do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end
      it "発送までの日数が選択されていなければ登録できない" do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 0")
      end
      it "価格が空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が、¥300~¥9,999,999の間でないと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格の範囲が、¥300~¥9,999,999の間でないと登録できない2" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "販売価格は半角数字のみ保存可能" do
        @item.price = ５００
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "画像は1枚必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end