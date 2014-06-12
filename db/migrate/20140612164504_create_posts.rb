class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string "title"
      t.text "url"
      t.text "text"
    end
  end
end
