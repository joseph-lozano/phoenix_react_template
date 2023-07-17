defmodule PhoenixSolidJSTemplate.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl Application
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhoenixSolidJSTemplateWeb.Telemetry,
      # Start the Ecto repository
      PhoenixSolidJSTemplate.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixSolidJSTemplate.PubSub},
      # Start Finch
      {Finch, name: PhoenixSolidJSTemplate.Finch},
      # Start the Endpoint (http/https)
      PhoenixSolidJSTemplateWeb.Endpoint
      # Start a worker by calling: PhoenixSolidJSTemplate.Worker.start_link(arg)
      # {PhoenixSolidJSTemplate.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixSolidJSTemplate.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl Application
  def config_change(changed, _new, removed) do
    PhoenixSolidJSTemplateWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
