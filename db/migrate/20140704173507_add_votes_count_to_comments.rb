class AddVotesCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :votes_count, :integer, :default => 0

      Comment.reset_column_information
      Comment.find(:all).each do |c|
        Comment.update_counters c.id, :votes_count => c.votes.length
      end
  end
end
