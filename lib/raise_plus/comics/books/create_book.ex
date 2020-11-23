defmodule RaisePlus.Comics.Books.CreateBook do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Multi
  alias RaisePlus.Comics.Books.Book

  embedded_schema do
    field :name, :string
    field :num, :integer
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:name, :num])
    |> validate_required([:name, :num])
  end

  def call(%Ecto.Changeset{valid?: true} = changeset, _deps) do
    book = apply_changes(changeset)

    multi = Multi.new()

    gen_names(book.name, book.num)
    |> Enum.reduce(multi, fn name, multi ->
      Multi.insert(multi, "book_#{name}", Book.changeset(%Book{}, %{name: name}))
    end)
  end

  defp gen_names(name, num) do
    Enum.map(1..num, fn n -> "#{name}_#{n}" end)
  end
end
