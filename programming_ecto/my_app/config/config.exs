use Mix.Config

config :my_app, :ecto_repos, [MyApp.Repo]

config :my_app, MyApp.Repo,
  database: "postgres",
  username: "username",
  password: "password",
  hostname: "localhost"
