defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller

  plug :validate_coordinates

  def index(conn, %{"latitude" => lat, "longitude" => lon}) do
    params = %{
      "lat" => lat,
      "lon" => lon,
      "units" => "imperial",
      "appid" => WeatherWeb.Endpoint.config(:weather_api_key)
    }

    case HTTPoison.get("http://api.openweathermap.org/data/2.5/onecall", 
      [], params: params) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        render(conn, "index.json", %{data: Jason.decode!(body)})
      {:ok, %HTTPoison.Response{status_code: _, body: body}} ->
        error(conn, "Error: there was a problem getting data from OpenWeatherMap")
    end
  end

  defp validate_coordinates(conn, _) do
    case conn.body_params do
      %{"latitude" => ""} ->
        conn
        |> error("Error: latitude is required")
        |> halt()
      %{"longitude" => ""} ->
        conn
        |> error("Error: longitude is required")
        |> halt()
      _ ->
        conn
    end
  end

  defp error(conn, message) do
    conn
    |> put_status(400)
    |> render("error.json", %{message: message})
  end
end
