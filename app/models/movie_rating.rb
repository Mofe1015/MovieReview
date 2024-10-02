class MovieRating < ApplicationRecord
  belongs_to :movie
  has_many :movie_rating_categories, dependent: :destroy
  accepts_nested_attributes_for :movie_rating_categories, allow_destroy: true
end
