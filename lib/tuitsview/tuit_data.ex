defmodule Tuitsview.TuitData do
  use Ecto.Schema

  @primary_key {:id, :string, []}
  schema "extended_tuit" do
    field :text, :string
    # field :author_id, :string
    field :place_id, :string
    field :source, :string
    field :created_at, :naive_datetime
    field :reply_settings, :string
    field :conversation_id, :string
    field :raw_tuit_id, :string
    field :inserted_at, :naive_datetime

    belongs_to :author, Tuitsview.TuitAuthor
  end
end
