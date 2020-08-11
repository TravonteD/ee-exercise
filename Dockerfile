FROM elixir:slim

WORKDIR /app

COPY . .

ARG SECRET_KEY_BASE
ARG API_KEY

ENV MIX_ENV=prod

RUN mix local.hex --force \
      && mix local.rebar --force \
      && mix do deps.get, deps.compile \
      && mix compile

EXPOSE 4000

CMD ["mix", "phx.server"]
