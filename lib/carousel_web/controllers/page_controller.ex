defmodule CarouselWeb.PageController do
  use CarouselWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
