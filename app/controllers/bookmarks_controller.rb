class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :created]
  before_action :set_bookmark, only: [:destroy]
  
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
