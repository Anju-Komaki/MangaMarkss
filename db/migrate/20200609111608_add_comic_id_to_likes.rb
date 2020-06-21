# frozen_string_literal: true

class AddComicIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :comic_id, :integer
  end
end
