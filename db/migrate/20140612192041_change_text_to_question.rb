class ChangeTextToQuestion < ActiveRecord::Migration
  def change
    rename_column(:posts, :text, :question)
  end
end
