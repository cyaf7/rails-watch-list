class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
    @list = List.find(params[:list_id])
  end

  def create
    bookmark = Bookmark.new(bookmark_params)
    list = List.find(params[:list_id])
    bookmark.list = list
    bookmark.save
    redirect_to list_path(list)
  end

  

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
