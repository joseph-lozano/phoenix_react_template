defmodule PhoenixReactTemplate.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl Application
  def start(_type, _args) do
    children = [
      PhoenixReactTemplateWeb.Telemetry,
      PhoenixReactTemplate.Repo,
      {DNSCluster, query: Application.get_env(:my_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixReactTemplate.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixReactTemplate.Finch},
      # Start a worker by calling: PhoenixReactTemplate.Worker.start_link(arg)
      # {PhoenixReactTemplate.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixReactTemplateWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixReactTemplate.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl Application
  def config_change(changed, _new, removed) do
    PhoenixReactTemplateWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
