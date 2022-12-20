defmodule TuitsviewWeb.StatsController do
  use TuitsviewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"action" => action}) do
    #render(conn, "show.html", action: action)
    conn
    |> Plug.Conn.assign(:action, action)
    |> put_flash(:info, "This is a flash for action #{action}")
    #|> put_root_layout(false)
    |> render("show.html")
  end
end
