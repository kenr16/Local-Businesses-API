class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :author
      t.integer :price
      t.integer :rating
      t.text :content
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
