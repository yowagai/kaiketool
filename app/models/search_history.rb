class SearchHistory < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type

  belongs_to :user
  # has_one_attached :image
end
