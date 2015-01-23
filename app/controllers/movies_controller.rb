class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def home
  end

  def index
    @movies = Movie.all
    @q = Movie.ransack(params[:q])
    @movies = @q.result(distinct: true)
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

      if @movie.save
        redirect_to @movie, notice: 'Movie was successfully created.'
      else
        render :new
      end
  end

  def update
      if @movie.update(movie_params)
       redirect_to @movie, notice: 'Movie was successfully updated.'
      else
        render :edit
    end
  end

  def destroy
    @movie.destroy
      redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  end

  private

    def sort_column
      Movie.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :format, :length, :release_year, :rating)
    end


end
