class AddVoteCountToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :votes_count, :integer, null: false, default: 0
  end
end
