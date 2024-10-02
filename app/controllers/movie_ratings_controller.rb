class MovieRatingsController < ApplicationController
  before_action :set_movie

  def new
    @movie_rating = @movie.movie_ratings.build
    build_rating_categories(@movie_rating)
  end

  def create
    @movie_rating = @movie.movie_ratings.build(movie_rating_params)
    if @movie_rating.save
      redirect_to movie_path(@movie), notice: "Your review has been submitted."
    else
      render :new
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def movie_rating_params
    params.require(:movie_rating).permit(
      movie_rating_categories_attributes: [:category_id, :score]
    )
  end

  def build_rating_categories(movie_rating)
    categories = Category.all
    categories.each do |category|
      movie_rating.movie_rating_categories.build(category: category)
    end
  end
end