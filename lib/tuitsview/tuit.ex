defmodule Tuitsview.Tuit do
  @moduledoc """
  The Tuit context.
  """

  import Ecto.Query, warn: false
  alias Tuitsview.TuitsRepo

  alias Tuitsview.Tuit.TuitAuthor
  alias Tuitsview.Tuit.TuitData

  @authors_per_page 20

  @doc """
  Returns the list of authors.

  ## Examples

      iex> list_authors()
      [%TuitAuthor{}, ...]

  """
  def list_authors do
    TuitsRepo.all(TuitAuthor)
  end

  def top_author_tuits do
    # query = from p in TuitAuthor,
    #           join: c in assoc(p, :extended_tuit),
    #           group_by: [p.id, c.author_id],
    #           where: p.id == c.author_id,
    #           select: %{author: p, count_tuits: count(p.id)}
    TuitAuthor
    |> join(:inner, [a], p in TuitData, on: a.id == p.author_id)
    |> group_by([a,p],[a.id, p.author_id])
    |> select([a, p], %{
        author: a,
        count_tuits: fragment("count(?) as count_tuits", p.id)
      })
    |> order_by(desc: fragment("count_tuits"))
    |> limit(30)
    |> TuitsRepo.all()
    # TuitsRepo.all(query)
  end



  @doc """
  Gets a single tuit_author.

  Raises `Ecto.NoResultsError` if the Tuit author does not exist.

  ## Examples

      iex> get_tuit_author!(123)
      %TuitAuthor{}

      iex> get_tuit_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tuit_author!(id), do: TuitsRepo.get!(TuitAuthor, id)




  # @doc """
  # Creates a tuit_author.

  # ## Examples

  #     iex> create_tuit_author(%{field: value})
  #     {:ok, %TuitAuthor{}}

  #     iex> create_tuit_author(%{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def create_tuit_author(attrs \\ %{}) do
  #   %TuitAuthor{}
  #   |> TuitAuthor.changeset(attrs)
  #   |> TuitRepo.insert()
  # end

  # @doc """
  # Updates a tuit_author.

  # ## Examples

  #     iex> update_tuit_author(tuit_author, %{field: new_value})
  #     {:ok, %TuitAuthor{}}

  #     iex> update_tuit_author(tuit_author, %{field: bad_value})
  #     {:error, %Ecto.Changeset{}}

  # """
  # def update_tuit_author(%TuitAuthor{} = tuit_author, attrs) do
  #   tuit_author
  #   |> TuitAuthor.changeset(attrs)
  #   |> Repo.update()
  # end

  # @doc """
  # Deletes a tuit_author.

  # ## Examples

  #     iex> delete_tuit_author(tuit_author)
  #     {:ok, %TuitAuthor{}}

  #     iex> delete_tuit_author(tuit_author)
  #     {:error, %Ecto.Changeset{}}

  # """
  # def delete_tuit_author(%TuitAuthor{} = tuit_author) do
  #   Repo.delete(tuit_author)
  # end

  # @doc """
  # Returns an `%Ecto.Changeset{}` for tracking tuit_author changes.

  # ## Examples

  #     iex> change_tuit_author(tuit_author)
  #     %Ecto.Changeset{data: %TuitAuthor{}}

  # """
  # def change_tuit_author(%TuitAuthor{} = tuit_author, attrs \\ %{}) do
  #   TuitAuthor.changeset(tuit_author, attrs)
  # end
end
