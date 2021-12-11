defmodule BowlingGameWeb.PageController do
  use BowlingGameWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
