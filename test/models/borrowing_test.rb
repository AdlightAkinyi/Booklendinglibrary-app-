require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "user@example.com", password: "password")
    @book = Book.create(title: "1984", author: "George Orwell", isbn: "9876543210")
    @borrowing = Borrowing.new(user: @user, book: @book, due_date: 2.weeks.from_now, returned: false)
  end

  test "should be valid with user, book, and due date" do
    assert @borrowing.valid?
  end

  test "should be invalid without user" do
    @borrowing.user = nil
    assert_not @borrowing.valid?
  end

  test "should be invalid without book" do
    @borrowing.book = nil
    assert_not @borrowing.valid?
  end

  test "should be invalid without due date" do
    @borrowing.due_date = nil
    assert_not @borrowing.valid?
  end

  test "should mark book as returned" do
    @borrowing.update(returned: true)
    assert @borrowing.returned
  end
end

