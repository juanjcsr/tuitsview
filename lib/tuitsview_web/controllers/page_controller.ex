defmodule TuitsviewWeb.PageController do
  use TuitsviewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
