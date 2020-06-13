class CreateInfoCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :info_categories do |t|
      t.references :category, foreign_key: true
      t.references :information, foreign_key: true

      t.timestamps
    end
  end
end
