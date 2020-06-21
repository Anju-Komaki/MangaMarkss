# frozen_string_literal: true

class RemoveRateFromComic < ActiveRecord::Migration[5.2]
  def change
    remove_column :comics, :rate, :float
  end
end
