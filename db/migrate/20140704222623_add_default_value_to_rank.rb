class AddDefaultValueToRank < ActiveRecord::Migration
  def change
    change_column :posts, :rank, :integer, :default => 0
  end
end
