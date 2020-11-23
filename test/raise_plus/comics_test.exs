defmodule RaisePlus.ComicsTest do
  use RaisePlus.DataCase

  alias RaisePlus.Comics

  describe "books" do
    alias RaisePlus.Comics.Book

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Comics.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Comics.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Comics.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Comics.create_book(@valid_attrs)
      assert book.name == "some name"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Comics.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Comics.update_book(book, @update_attrs)
      assert book.name == "some updated name"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Comics.update_book(book, @invalid_attrs)
      assert book == Comics.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Comics.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Comics.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Comics.change_book(book)
    end
  end
end
