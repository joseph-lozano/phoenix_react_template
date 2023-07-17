# Phoenix SolidJS Template

This is a template for running a [SolidJS](https://solidjs.com) app with a Phoenix Backend.


To start your Phoenix server:

  * Run `mix setup` to install and setup NPM and Elixir dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
  * (Optional) Install [pre-commit](https://pre-commit.com/#install) and run `pre-commit install` to setup pre-commit hooks. If installed, the hooks can be bypassed by passing `--no-verify` when running `git commit`.

## About

When running in `dev`, requests are proxied to the locally running Vite server. This keeps features like Hot Module Reloading and other Dev niceties working smoothly.

When not in dev, you should run `npm run build --prefix assets`.
This is already done in the `mix test` alias and in the Dockerfile.

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Renaming your project

Run `./rename.sh` to rename your project.
You can then remove `{:rename_project, "~> 0.1.0", only: :dev}` from your `mix.exs` file, and delete the renaming script.
