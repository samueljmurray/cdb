# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cdb,
  ecto_repos: [Cdb.Repo]

# Configures the endpoint
config :cdb, CdbWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wPMvTfFInzEk7OTJZS2UXV5GbziiZ2StnC4m3AFas+HZjhpS5DqKwlahIP/Ld9rf",
  render_errors: [view: CdbWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cdb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
