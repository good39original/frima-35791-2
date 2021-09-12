class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,          presence: true
  validates :password,                          format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :family_name,       presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } #ここがユーザーお名前全角の正規表現
  validates :first_name,        presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } #ここがユーザーお名前全角の正規表現
  validates :family_name_kana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } #ここがユーザーお名前の全角カタカナ
  validates :first_name_kana,   presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } #ここがユーザーお名前の全角カタカナ
  validates :birth_day,         presence: true

end
