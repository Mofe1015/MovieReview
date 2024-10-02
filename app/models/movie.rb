class Movie < ApplicationRecord
  has_many :movie_ratings, dependent: :destroy
  accepts_nested_attributes_for :movie_ratings, allow_destroy: true

  # Method to calculate average score for a specific category
  def average_score_for_category(category_id)
    scores = movie_ratings.joins(:movie_rating_categories)
                          .where(movie_rating_categories: { category_id: category_id })
                          .pluck('movie_rating_categories.score')
    return 0 if scores.empty?

    (scores.sum.to_f / scores.size).round(2)
  end

  # Method to calculate total average score across all categories
  def total_average_score
    category_ids = Category.pluck(:id)
    scores = category_ids.map { |id| average_score_for_category(id) }
    total_score = scores.sum
    total_count = scores.count { |score| score > 0 }
    
    return 0 if total_count.zero?

    (total_score.to_f / total_count).round(2)
  end

  # Method to get average scores for all categories
  def average_scores
    Category.all.map do |category|
      {
        category_name: category.name,
        average_score: average_score_for_category(category.id)
      }
    end
  end
end
