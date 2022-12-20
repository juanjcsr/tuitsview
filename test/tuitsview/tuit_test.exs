defmodule Tuitsview.TuitTest do
  use Tuitsview.DataCase

  alias Tuitsview.Tuit

  describe "authors" do
    alias Tuitsview.Tuit.TuitAuthor

    import Tuitsview.TuitFixtures

    @invalid_attrs %{name: nil}

    test "list_authors/0 returns all authors" do
      tuit_author = tuit_author_fixture()
      assert Tuit.list_authors() == [tuit_author]
    end

    test "get_tuit_author!/1 returns the tuit_author with given id" do
      tuit_author = tuit_author_fixture()
      assert Tuit.get_tuit_author!(tuit_author.id) == tuit_author
    end

    test "create_tuit_author/1 with valid data creates a tuit_author" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %TuitAuthor{} = tuit_author} = Tuit.create_tuit_author(valid_attrs)
      assert tuit_author.name == "some name"
    end

    test "create_tuit_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tuit.create_tuit_author(@invalid_attrs)
    end

    test "update_tuit_author/2 with valid data updates the tuit_author" do
      tuit_author = tuit_author_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %TuitAuthor{} = tuit_author} = Tuit.update_tuit_author(tuit_author, update_attrs)
      assert tuit_author.name == "some updated name"
    end

    test "update_tuit_author/2 with invalid data returns error changeset" do
      tuit_author = tuit_author_fixture()
      assert {:error, %Ecto.Changeset{}} = Tuit.update_tuit_author(tuit_author, @invalid_attrs)
      assert tuit_author == Tuit.get_tuit_author!(tuit_author.id)
    end

    test "delete_tuit_author/1 deletes the tuit_author" do
      tuit_author = tuit_author_fixture()
      assert {:ok, %TuitAuthor{}} = Tuit.delete_tuit_author(tuit_author)
      assert_raise Ecto.NoResultsError, fn -> Tuit.get_tuit_author!(tuit_author.id) end
    end

    test "change_tuit_author/1 returns a tuit_author changeset" do
      tuit_author = tuit_author_fixture()
      assert %Ecto.Changeset{} = Tuit.change_tuit_author(tuit_author)
    end
  end
end
