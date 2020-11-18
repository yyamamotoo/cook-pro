class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  belongs_to :user
  has_one_attached :image
  has_many :comments

  with_options presence: true do
    validates :video
    validates :title
    validates :text
    validates :image
    validates :cook_1
    validates :vegetable_1
    validates :food_1
  end
  validates :genre_id, numericality: { other_than: 1 }

  validate :cook_2
  validate :cook_3
  validate :cook_4
  validate :cook_5
  validate :cook_6
  validate :cook_7
  validate :cook_8
  validate :cook_9
  validate :cook_10

  validate :vegetable_2
  validate :vegetable_3
  validate :vegetable_4
  validate :vegetable_5
  validate :vegetable_6
  validate :vegetable_7
  validate :vegetable_8
  validate :vegetable_9
  validate :vegetable_10

  validate :food_2
  validate :food_3
  validate :food_4
  validate :food_5
  validate :food_6
  validate :food_7
  validate :food_8
  validate :food_9
  validate :food_10
end
