class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'イライラ' },
    { id: 3, name: '関心' },
  ]

  include ActiveHash::Associations
  has_many :search_histories
end