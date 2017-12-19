defmodule CDBWeb.CollectionView do
  use CDBWeb, :view

  def render_sir_trevor_block(%{"type" => "video", "data" => %{"source" => "vimeo", "remote_id" => remote_id}}) do
    url = "https://player.vimeo.com/video/" <> remote_id
    content_tag(:iframe, [], src: url, width: "640", height: "360", frameborder: "0", webkitallowfullscreen: true, mozallowfullscreen: true, allowfullscreen: true)
  end
  def render_sir_trevor_block(%{"type" => "image", "data" => %{"file" => %{"image" => %{"web" => url}}}} = block) do
    img_tag(url)
  end
  def render_sir_trevor_block(%{"type" => "text", "data" => %{"text" => html}}) do
    raw(html)
  end
  def render_sir_trevor_block(_block), do: nil
end
