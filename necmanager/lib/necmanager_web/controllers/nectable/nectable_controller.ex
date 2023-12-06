defmodule NecmanagerWeb.NectableController do
  use NecmanagerWeb, :controller

  def index(conn, _params) do
    getCharactersvgs = fn -> Path.wildcard("priv/static/images/characters/*.svg") end
    render(conn, :index, characters: getCharactersvgs.())
  end
end
