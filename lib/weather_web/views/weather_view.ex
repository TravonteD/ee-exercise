defmodule WeatherWeb.WeatherView do
  use WeatherWeb, :view

  def render("index.json", %{data: data}) do
    current = map_current_data(data["current"])
    daily = Enum.map(data["daily"], &(map_daily_data(&1)))

    Map.merge(current, %{daily: daily})
  end

  defp map_current_data(data) do
    %{
      "dt" => date,
      "wind_speed" => wind_speed,
      "wind_deg" => wind_bearing,
      "temp" => temp,
      "weather" => [
        %{ 
          "main" => type,
          "description" => description
        }
      ]
    } = data

    %{
      date: format_date(date),
      type: type,
      description: description,
      temperature: temp,
      wind: %{
        speed: wind_speed,
        bearing: wind_bearing,
      }
    }
  end

  defp format_date(date) do
    {:ok, dt} = DateTime.from_unix(date)

    dt 
    |> DateTime.to_date 
    |> Date.to_string
  end

  defp map_daily_data(datum) do
    %{
      "dt" => date,
      "temp" => %{
        "min" => temp_low,
        "max" => temp_high,
      },
      "weather" => [
        %{ 
          "main" => type,
          "description" => description
        }
      ]
    } = datum

    %{
      date: format_date(date),
      type: type,
      description: description,
      temperature: %{
        low: temp_low,
        high: temp_high,
      }
    }
  end
end
