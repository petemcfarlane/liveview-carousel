defmodule CarouselWeb.CarouselLive do
  use CarouselWeb, :live_view

  alias CarouselWeb.Components.ImageComponent

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
    <div>
      <ImageComponent.random_img seed={@seed} />
    </div>

    <button phx-click="prev">prev</button>
    <button phx-click="next">next</button>
    """
  end
end
