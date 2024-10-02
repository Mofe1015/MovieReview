class Category < ApplicationRecord
  has_many :movie_rating_categories
  has_many :movie_ratings, through: :movie_rating_categories

  validates :name, presence: true, uniqueness: true
end
