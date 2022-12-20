defmodule Tuitsview.Tuit.TuitAuthor do
  use Ecto.Schema
  # import Ecto.Changeset

  @primary_key {:id, :string, []}
  schema "authors" do
    field :url, :string
    field :name, :string
    field :location, :string
    field :verified, :boolean
    field :created_at, :naive_datetime
    field :username, :string
    field :description, :string
    field :pinned_tweet_id, :string
    field :profile_image_url, :string
    field :inserted_at, :naive_datetime

    has_many :extended_tuit, Tuitsview.Tuit.TuitData, foreign_key: :author_id
  end

  # @doc false
  # def changeset(tuit_author, attrs) do
  #   tuit_author
  #   |> cast(attrs, [:name])
  #   |> validate_required([:name])
  # end
end
