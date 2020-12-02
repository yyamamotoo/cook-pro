class Material < ApplicationRecord
  belongs_to :recipe

  with_options presence: true do
    validates :vegetable
    validates :amount
  end
end
