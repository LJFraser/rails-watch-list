class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to @bookmark.list, notice: 'Bookmark was successfully created'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end
end

private

def set_bookmark
  @bookmark = Bookmark.find(params[:id])
end

def bookmark_params
  params.require(:bookmark).permit(:comment, :movie_id)
end
