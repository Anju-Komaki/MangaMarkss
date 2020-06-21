# frozen_string_literal: true

class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
