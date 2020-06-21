# frozen_string_literal: true

class ChangeLikesToClip < ActiveRecord::Migration[5.2]
  def change
    rename_table :likes, :clips
  end
end
