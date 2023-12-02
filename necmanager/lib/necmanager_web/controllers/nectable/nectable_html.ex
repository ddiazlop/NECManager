defmodule NecmanagerWeb.NectableHTML do
  use NecmanagerWeb, :html

  embed_templates "nectable_html/*"

  def participant(assigns) do
    ~H"""
     <NecmanagerWeb.NecTable.participant username={@username} />
    """
  end

end
