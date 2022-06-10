defmodule CarouselWeb.Components.ImageComponent do
  use CarouselWeb, :component

  def random_img(assigns) do
    ~H"""
    <img src={"https://picsum.photos/seed/#{@seed}/500/300"} />
    """
  end
end
