defmodule NecmanagerWeb.NecTableLive do
  use NecmanagerWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :brightness, 10)}
  end
end
#TODO: This liveview is not working
