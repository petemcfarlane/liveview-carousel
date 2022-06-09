defmodule CarouselWeb.Components.CarouselComponent do
  use CarouselWeb, :component
  alias Phoenix.LiveView.JS

  def carousel(assigns) do
    ~H"""
    <div class="carousel">
      <div class="offset">
        <div><%= render_slot @prev %></div>
        <div><%= render_slot @current %></div>
        <div><%= render_slot @next %></div>
      </div>
    </div>
    """
  end

  def up(js \\ %JS{}) do
    js |> JS.transition("animate-slide-up", to: ".carousel > .offset > div")
  end

  def down(js \\ %JS{}) do
    js |> JS.transition("animate-slide-down", to: ".carousel > .offset > div")
  end
end
