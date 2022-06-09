defmodule CarouselWeb.CarouselLive do
  use CarouselWeb, :live_view

  alias CarouselWeb.Components.{CarouselComponent, ImageComponent}
  alias Phoenix.LiveView.JS

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, seed: 100)}
  end

  @impl true
  def handle_event("prev", _, socket), do: socket |> update_seed(-1)

  @impl true
  def handle_event("next", _, socket), do: socket |> update_seed(+1)

  defp update_seed(socket, diff),
    do: {:noreply, assign(socket, seed: socket.assigns.seed + diff)}

  @impl true
  def render(assigns) do
    ~H"""
    <CarouselComponent.carousel>
      <:prev>
        <ImageComponent.random_img seed={@seed - 1} />
      </:prev>
      <:current>
        <ImageComponent.random_img seed={@seed} />
      </:current>
      <:next>
        <ImageComponent.random_img seed={@seed + 1} />
      </:next>
    </CarouselComponent.carousel>

    <button phx-click={prev()} phx-throttle="200">prev</button>
    <button phx-click={next()} phx-throttle="200">next</button>
    """
  end

  def prev(js \\ %JS{}) do
    js
    |> JS.push("prev")
    |> CarouselComponent.down()
  end

  def next(js \\ %JS{}) do
    js
    |> JS.push("next")
    |> CarouselComponent.up()
  end
end
