class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128

  validates :nickname, presence: { message: "can\'t be blank" }
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/i, message: 'confirmation is invalid' }
  validates :first_name, presence: { message: "can\'t be blank" },
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: { message: "can\'t be blank" },
                        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana, presence: { message: "can\'t be blank" },
                              format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: { message: "can\'t be blank" },
                             format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: { message: "can\'t be blank" }

  # 出品機能時に実装
  has_many :items
  # has_many :purchases

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
