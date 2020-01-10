defmodule TickWeb.PageController do
  use TickWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
