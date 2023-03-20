class CreateSearchHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :search_histories do |t|

      t.timestamps
    end
  end
end
