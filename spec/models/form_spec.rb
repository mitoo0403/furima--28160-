require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @form = FactoryBot.build(:form)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it "トークン、郵便番号、都道府県、市区町村、番地、電話番号、item_id、user_idが存在すれば登録できる" do
        expect(@form).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "郵便番号が空だと購入できない" do
        @form.postcode = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Postcode can't be blank")
      end
      it "郵便番号に-がないと購入できない" do
        @form.postcode = "7190222"
        @form.valid?
        expect(@form.errors.full_messages).to include("Postcode is invalid")
      end
      it "郵便番号は３桁-４桁でないと購入できない" do
        @form.postcode = "71-90222"
        @form.valid?
        expect(@form.errors.full_messages).to include("Postcode is invalid")
      end
      it "都道府県が選択されていなければ購入できない" do
        @form.area_id = 0
        @form.valid?
        expect(@form.errors.full_messages).to include("Area must be other than 0")
      end
      it "市区町村が空だと購入できない" do
        @form.municipality = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空だと購入できない" do
        @form.address = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空だと購入できない" do
        @form.tel = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel can't be blank")
      end
      it "電話番号が11桁以上だと購入できない" do
        @form.tel = "090777773333"
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
      end
      it "電話番号が半角数字でないと購入できない" do
        @form.tel = "０９０７７７７３３３３"
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel is invalid")
      end
      it "トークンが空だと購入できない" do
        @form.token = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
      