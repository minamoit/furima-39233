class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128

  validates :nickname, presence: { message: 'can\'t be blank' }
  validates :email,format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Please enter a valid format' },
                    uniqueness: { message: 'Already exists' }
  validates :password,format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: 'Please enter a combination of alphanumeric characters' }
  validates :password_confirmation, presence: { message: 'can\'t be blank' }
  validates :first_name, presence: { message: 'can\'t be blank' }
  validates :last_name, presence: { message: 'can\'t be blank' }
  validates :first_name_kana, presence: { message: 'can\'t be blank' }
  validates :last_name_kana, presence: { message: 'can\'t be blank' }
  validates :birth_day, presence: { message: 'can\'t be blank' }


  has_many :items
  has_many :purchases

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
