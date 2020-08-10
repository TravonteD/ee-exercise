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

  test "GET /weather with missing latitude", %{conn: conn} do
    params = %{
      "latitude" => "",
      "longitude" => "-84.3883"
    }
    conn = get(conn, "/weather", params)
    assert json_response(conn, 400) == %{
      "error" => "Error: latitude is required"
    }
  end

  test "GET /weather with missing longitude", %{conn: conn} do
    params = %{
      "latitude" => "33.7984",
      "longitude" => ""
    }
    conn = get(conn, "/weather", params)
    assert json_response(conn, 400) == %{
      "error" => "Error: longitude is required"
    }
  end
end
