defmodule WeatherWeb.WeatherControllerTest do
  use WeatherWeb.ConnCase

  test "GET /weather", %{conn: conn} do
    params = %{
      "latitude" => "33.7984",
      "longitude" => "-84.3883"
    }
    conn = get(conn, "/weather", params)
    assert json_response(conn, 200)
  end
end
