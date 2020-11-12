defmodule ExtremeStartupClient.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {
        Plug.Cowboy,
        scheme: :http,
        plug: ExtremeStartupClient.Router,
        options: [port: (System.get_env("PORT") || "4001") |> String.to_integer()]
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExtremeStartupClient.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
