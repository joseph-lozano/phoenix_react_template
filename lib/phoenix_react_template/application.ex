defmodule PhoenixReactTemplate.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl Application
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhoenixReactTemplateWeb.Telemetry,
      # Start the Ecto repository
      PhoenixReactTemplate.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixReactTemplate.PubSub},
      # Start Finch
      {Finch, name: PhoenixReactTemplate.Finch},
      # Start the Endpoint (http/https)
      PhoenixReactTemplateWeb.Endpoint
      # Start a worker by calling: PhoenixReactTemplate.Worker.start_link(arg)
      # {PhoenixReactTemplate.Worker, arg}
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
