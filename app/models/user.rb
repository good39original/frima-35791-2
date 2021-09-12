class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :emil ,             presence: true
  validates :nickname,          presence: true
  validates :password,          presence: true, length: {with: /^(?=.*?[a-z])(?=.*?\d)[a-z\d]/ }
  validates :family_name,       presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } #ここがユーザーお名前全角の正規表現
  validates :first_name,        presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } #ここがユーザーお名前全角の正規表現
  validates :family_name_kana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } #ここがユーザーお名前の全角カタカナ
  validates :first_name_kana,   presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } #ここがユーザーお名前の全角カタカナ
  validates :birth_day,         presence: true

end
