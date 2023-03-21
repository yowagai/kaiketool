class CreateSearchHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :search_histories do |t|
      t.references :user, null: false, foreign_kye: true
      t.string     :title, null: false
      t.text       :background
      t.integer    :type_id
      t.binary     :image
      t.timestamps
    end
  end
end
