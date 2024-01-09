class AddIndexToSearches < ActiveRecord::Migration[7.0]
  def change
    add_index :searches, :sentence
  end
end
