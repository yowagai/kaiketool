class SearchHistory < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :kaiketools

  def age
    now = Time.zone.now
    age = now.year - user.birthday.year
    age -= 1 if now.month < user.birthday.month || (now.month == user.birthday.month && now.day < user.birthday.day)
    age
  end

end
