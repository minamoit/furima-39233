class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128

  validates :nickname, presence: { message: "can\'t be blank" }
  validates :password,format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/i, message: "confirmation is invalid" }
  validates :first_name, presence: { message: "can\'t be blank" },
                         format: { with: /\A[^ -~｡-ﾟ]+\z/, message: "is invalid" },
                         format: { with: /\A[一-龯ぁ-んァ-ン]+\z/, message: "is invalid" }
  validates :last_name, presence: { message: "can\'t be blank" },
                        format: { with: /\A[^ -~｡-ﾟ]+\z/, message: "is invalid" },
                        format: { with: /\A[一-龯ぁ-んァ-ン]+\z/, message: "is invalid" }
  validates :first_name_kana, presence: { message: "can\'t be blank" },
                              format: { with: /\A[^ -~｡-ﾟ]+\z/, message: "is invalid" },
                              format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid" }
  validates :last_name_kana, presence: { message: "can\'t be blank" },
                             format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid" }
  validates :birth_day, presence: { message: "can\'t be blank" }

  #出品機能時に実装
  #has_many :items
  #has_many :purchases

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
