defmodule Tuitsview.TuitFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tuitsview.Tuit` context.
  """

  @doc """
  Generate a tuit_author.
  """
  def tuit_author_fixture(attrs \\ %{}) do
    {:ok, tuit_author} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Tuitsview.Tuit.create_tuit_author()

    tuit_author
  end
end
