class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :name, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "に＠と.を含めてください" }

  validates :password, presence: true,
                       format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/, message: "は英数字を含む6文字以上を入力して下さい" }

  has_many :recipes
  has_many :comments

end
