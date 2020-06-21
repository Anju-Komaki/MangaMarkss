# frozen_string_literal: true

class AddRateToComic < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :rate, :float, null: false, default: 0
  end
end
