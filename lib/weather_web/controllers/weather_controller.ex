defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller

  def index(conn, %{"latitude" => lat, "longitude" => lon}) do
    {:ok, response} = HTTPoison.get("http://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&units=imperial&appid=#{System.get_env("API_KEY")}")
    render(conn, "index.json", %{data: Jason.decode!(response.body)})
  end
end
