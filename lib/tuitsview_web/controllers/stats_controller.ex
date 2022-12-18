defmodule TuitsviewWeb.StatsController do
  use TuitsviewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"action" => action}) do
    render(conn, "show.html", action: action)
  end
end
