class MovieRatingCategory < ApplicationRecord
  belongs_to :movie_rating
  belongs_to :category

  validates :score, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
