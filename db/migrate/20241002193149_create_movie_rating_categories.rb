class CreateMovieRatingCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_rating_categories do |t|
      t.references :movie_rating, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :score, null: false
      t.timestamps
    end
  end
end
