class Chef < ApplicationRecord
  belongs_to :recipe

  with_options presence: true do
    validates :cook
  end
end
