class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :child_name
    validates :parent_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/ } do
    validates :child_name_kana
    validates :parent_name_kana
  end
  validates :sex_id, presence: true, numericality: { other_than: 1, message: 'を選択して下さい' }
  validates :birthday, presence: true

end
