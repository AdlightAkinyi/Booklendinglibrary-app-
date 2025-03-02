require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    @book = Book.new(title: "The Great Gatsby", author: "F. Scott Fitzgerald", isbn: "1234567890")
  end

  test "should be valid with all attributes" do
    assert @book.valid?
  end

  test "should be invalid without title" do
    @book.title = nil
    assert_not @book.valid?
  end

  test "should be invalid without author" do
    @book.author = nil
    assert_not @book.valid?
  end

  test "should be invalid without ISBN" do
    @book.isbn = nil
    assert_not @book.valid?
  end

  test "should have unique ISBN" do
    @book.save
    duplicate_book = @book.dup
    assert_not duplicate_book.valid?
  end
end

