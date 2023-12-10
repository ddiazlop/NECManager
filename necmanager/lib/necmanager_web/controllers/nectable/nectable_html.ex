defmodule NecmanagerWeb.NectableHTML do
  use NecmanagerWeb, :html

  embed_templates "templates/*"

  def participant(assigns) do
    ~H"""
    <NecmanagerWeb.NecTable.participant username={@username} characters={@characters} />
    """
  end
end
