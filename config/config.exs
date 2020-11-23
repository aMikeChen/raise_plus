# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :raise_plus,
  ecto_repos: [RaisePlus.Repo]

# Configures the endpoint
config :raise_plus, RaisePlusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rXgmdqydrFYG/cNanqYdIDH3KFsv5HMyjc60Q+Ejo8mD7Zf+8v2f1Cree2kLxwg6",
  render_errors: [view: RaisePlusWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RaisePlus.PubSub,
  live_view: [signing_salt: "iEn1f+MA"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
