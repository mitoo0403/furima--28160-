class Form
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :area_id, :municipality, :address, :building_name, :tel #テーブルのカラムの代わり

  # attr_accessor :item_id, :user_id, :postcode, :area_id, :municipality, :address, :building_name, :tel, :order_id #テーブルのカラムの代わり

  Half_width_numbers = /\A[0-9]+\z/

  #validationをaddress.rbとorder.rbから引っ張ってくる
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postcode
    validates :area_id
    validates :municipality
    validates :address
    validates :tel, format: { with: Half_width_numbers }
  end  

  def save
     order = Order.create(item_id: item_id, user_id: user_id)
    # 注文の情報を保存
     Order.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
     Address.create(postcode: postcode, area_id: area_id, municipality: municipality, address: address, building_name: building_name, tel: tel, order_id: order.id)
  end

end