# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :efood,
  ecto_repos: [Efood.Repo]

# Configures the endpoint
config :efood, EfoodWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ccmS8HxzJszhAQ6wG7xn+qRsoR9qSLMfr5/01LX8lRbXEM6PtoFG1jiR/vvKE/RI",
  render_errors: [view: EfoodWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Efood.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "pOrM8sk9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [default_scope: "user:email"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "1b84593e3264a7be8df5",
  client_secret: "45ee21ac537d8bb91db697ffdbcf092b5935cd2d"
