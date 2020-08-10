defmodule WeatherWeb.PageViewTest do
  use WeatherWeb.ConnCase, async: true

  test "index.json" do
    weather_data = Jason.decode!(File.read!("test/support/test.json"))

    rendered_weather = WeatherWeb.WeatherView.render("index.json", %{data: weather_data})

    assert rendered_weather == %{
      date: "2020-08-10",
      description: "few clouds",
      temperature: 91,
      type: "Clouds",
      wind: %{
        bearing: 0,
        speed: 4.7
      },
      daily: [
        %{
          date: "2020-08-10", 
          description: "moderate rain", 
          temperature: %{
            high: 93.88, 
            low: 82.36
          }, 
          type: "Rain"
        }, 
        %{
          date: "2020-08-11", 
          description: "moderate rain", 
          temperature: %{
            high: 97.12, 
            low: 78.85
          }, 
          type: "Rain"
        }, 
        %{
          date: "2020-08-12", 
          description: "moderate rain", 
          temperature: %{
            high: 99.66, 
            low: 80.2
          }, 
          type: "Rain"
        }, 
        %{
          date: "2020-08-13", 
          description: "moderate rain", 
          temperature: %{
            high: 94.98, 
            low: 81.5
          }, 
          type: "Rain"
        }, 
        %{
          date: "2020-08-14",
          description: "moderate rain", 
          temperature: %{
            high: 89.76, 
            low: 79.45
          }, 
          type: "Rain"
        }, 
        %{
          date: "2020-08-15", 
          description: "moderate rain", 
          temperature: %{
            high: 87.64, 
            low: 77.86
          }, 
          type: "Rain"
        }, 
        %{
          date: "2020-08-16", 
          description: "light rain",
          temperature: %{
            high: 95.25,
            low: 77.5
          }, 
          type: "Rain"
        }, 
        %{
          date: "2020-08-17", 
          description: "light rain", 
          temperature: %{
            high: 98.8, 
            low: 79.66
          }, 
          type: "Rain"
        }
        ]
      }
  end
end
