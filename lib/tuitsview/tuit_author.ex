defmodule Tuitsview.TuitAuthor do
  use Ecto.Schema
  alias Tuitsview.TuitAuthor

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

    has_many :extended_tuit, Tuitsview.TuitData, foreign_key: :author_id
  end
end
