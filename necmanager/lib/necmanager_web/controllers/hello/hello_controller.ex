defmodule NecmanagerWeb.HelloController do
  use NecmanagerWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
