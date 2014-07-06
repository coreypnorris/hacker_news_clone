class ChangeDefaultValueOfRank < ActiveRecord::Migration
  def change
    change_column :posts, :rank, :integer, :default => 1
  end
end
