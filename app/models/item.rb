class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  Half_width_numbers = /\A[0-9]+\z/

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :delivery_free_id
    validates :area_id
    validates :day_id
    validates :price, format: { with: Half_width_numbers }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :delivery_free_id
    validates :area_id
    validates :day_id
  end

  belongs_to :user
  # has_many :comments
  # has_one :order

  has_one_attached :image
  validates :image, presence: true

  belongs_to :category
  belongs_to :status
  belongs_to :delivery_free
  belongs_to :area
  belongs_to :day

end
