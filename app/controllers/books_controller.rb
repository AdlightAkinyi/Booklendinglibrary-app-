
class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:borrow, :return] 
  before_action :set_book, only: [:show, :borrow, :return]

  def index
    @books = Book.all
  end

  def show
    # Logic for showing a book
  end

  def borrow
    # Logic for borrowing a book
  end

  def return
    # Logic for returning a book
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end

