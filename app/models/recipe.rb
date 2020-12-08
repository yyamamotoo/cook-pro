class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :materials, dependent: :destroy
  accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true
  has_many :chefs, dependent: :destroy
  accepts_nested_attributes_for :chefs, reject_if: :all_blank, allow_destroy: true

  with_options presence: true do
    validates :video
    validates :title
    validates :text
    validates :image
  end
  validates :genre_id, numericality: { other_than: 1, message: 'を選択して下さい' }
end
