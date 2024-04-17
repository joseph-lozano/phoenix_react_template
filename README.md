# Phoenix React Template

This is a template for running a [React](https://react.dev) app with a Phoenix Backend.

See also: [Phoenix SolidJS Template](https://github.com/joseph-lozano/phoenix_solid_js_template)

To start your Phoenix server:

- Run `mix setup` to install and setup NPM and Elixir dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
- (Optional) Install [pre-commit](https://pre-commit.com/#install) and run `pre-commit install` to setup pre-commit hooks. If installed, the hooks can be bypassed by passing `--no-verify` when running `git commit`.

## About

When running in `dev`, requests are proxied to the locally running Vite server. This keeps features like Hot Module Reloading and other Dev niceties working smoothly.

When not in dev, you should run `npm run build --prefix assets`.
This is already done in the `mix test` alias and in the Dockerfile.

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Renaming your project

Run `./rename.sh` to rename your project.
You can then remove `{:rename_project, "~> 0.1.0", only: :dev}` from your `mix.exs` file, and delete the renaming script.

## Using something other than Vite

- Create a backup of `assets/vite.config.js`
- `rm -rf assets/`
- `npm create vite assets/` and select your framework
- Add back in the vite.config.js, possibly changing the plugin to the apprpriate one
- The Phoenix watcher assumes the dev server is run with `npm run dev`. Change config/dev.exs if that is not true
- You may also need to update the Dockerfile

### Credits

A lot of the CI work was taken from Felt's [Ultimate Elixir CI](https://github.com/felt/ultimate-elixir-ci).
