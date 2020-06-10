class AddComicIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :comic_id, :integer
  end
end
