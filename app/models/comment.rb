class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :search_history

  validates :content, presence: true
end
