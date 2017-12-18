# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cdb,
  namespace: CDB,
  ecto_repos: [CDB.Repo]

# Configures the endpoint
config :cdb, CDBWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wPMvTfFInzEk7OTJZS2UXV5GbziiZ2StnC4m3AFas+HZjhpS5DqKwlahIP/Ld9rf",
  render_errors: [view: CDBWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CDB.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ex_aws, :s3,
  scheme: "https://",
  host: "s3-eu-west-1.amazonaws.com",
  region: "eu-west-1"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
