class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '' },
    { id: 3, name: '' },
  ]

  include ActiveHash::Associations
  has_many :search_histories
end