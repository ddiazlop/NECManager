defmodule Necmanager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NecmanagerWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:necmanager, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Necmanager.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Necmanager.Finch},
      # Start a worker by calling: Necmanager.Worker.start_link(arg)
      # {Necmanager.Worker, arg},
      # Start to serve requests, typically the last entry
      NecmanagerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Necmanager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NecmanagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
