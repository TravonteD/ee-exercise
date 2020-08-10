use Mix.Config

weather_api_key =
  System.get_env("API_KEY") ||
    raise """
    environment variable API_KEY is missing.
    make sure that it is exported
    """


config :weather, WeatherWeb.Endpoint,
  weather_api_key: weather_api_key
