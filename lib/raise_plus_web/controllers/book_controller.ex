defmodule RaisePlusWeb.BookController do
  use RaisePlusWeb, :controller

  alias RaisePlus.Comics.Books

  def create(conn, %{"name" => name, "num" => num}) do
    {:ok, result} = Books.create(name, num)
    books = Map.values(result) |> Enum.map(&Map.take(&1, [:name]))
    json(conn, books)
  end
end
