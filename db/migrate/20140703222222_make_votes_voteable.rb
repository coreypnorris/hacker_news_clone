class MakeVotesVoteable < ActiveRecord::Migration
  def change
    change_table :votes do |t|
      t.belongs_to :voteable, polymorphic: true
    end
    add_index :votes, [:voteable_id, :voteable_type]
  end
end
