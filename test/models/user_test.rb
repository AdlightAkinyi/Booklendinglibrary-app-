require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "user@example.com", password: "password")
    @book = Book.create(title: "Moby Dick", author: "Herman Melville", isbn: "1122334455")
    @borrowing = Borrowing.create(user: @user, book: @book, due_date: 2.weeks.from_now, returned: false)
  end

  test "user can borrow a book" do
    assert_includes @user.borrowed_books, @book
  end

  test "user's borrowed books should include only non-returned books" do
    @borrowing.update(returned: true)
    assert_not_includes @user.borrowed_books, @book
  end
end

