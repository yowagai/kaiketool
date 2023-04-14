class Kaiketool < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :type
  belongs_to :search_history
end
