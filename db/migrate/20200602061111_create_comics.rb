# frozen_string_literal: true

class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :isbn_code
      t.string :author
      t.string :publisher
      t.string :title_en
      t.string :author_en
      t.string :publisher_en
      t.string :comic_image_id
      t.text :body

      t.timestamps
    end
  end
end
