# frozen_string_literal: true

class RemoveCommentIdFromLike < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :comment_id, :integer
  end
end
