defmodule RaisePlus.Comics.Books do
  alias RaisePlus.Repo
  alias RaisePlus.Comics.Books

  def create(name, num) do
    changeset = Books.CreateBook.changeset(%{name: name, num: num})
    multi = Books.CreateBook.call(changeset, %{})
    Repo.transaction(multi)
  end
end
