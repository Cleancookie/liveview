defmodule Liveview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveviewWeb.Telemetry,
      # Start the Ecto repository
      Liveview.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Liveview.PubSub},
      # Start Finch
      {Finch, name: Liveview.Finch},
      # Start the Endpoint (http/https)
      LiveviewWeb.Endpoint
      # Start a worker by calling: Liveview.Worker.start_link(arg)
      # {Liveview.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Liveview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
