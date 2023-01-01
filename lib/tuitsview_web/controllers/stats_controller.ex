defmodule TuitsviewWeb.StatsController do
  use TuitsviewWeb, :controller
  alias Tuitsview.Tuit

  def index(conn, _params) do
    authors = Tuitsview.Tuit.top_author_tuits()
    render(conn, "index.html", authors: authors)
  end

  def show(conn, %{"action" => action}) do
    #render(conn, "show.html", action: action)
    conn
    |> Plug.Conn.assign(:action, action)
    |> put_flash(:info, "This is a flash for action #{action}")
    #|> put_root_layout(false)
    |> render("show.html")
  end

  def show_author(conn, %{"id" => id}) do
    author = Tuit.get_tuit_author!(id)
    render(conn, "show_author.html", author: author)
  end

end
