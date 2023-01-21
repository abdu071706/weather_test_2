class WeatherUtil {
  static kelvinToCelcius(num kelvin) {
    return (kelvin - 273.15).toStringAsFixed(0);
  }

  static String getWeatherIcon(num kelvin) {
    if (kelvin < 300) {
      return ' 🌧';
    } else if (kelvin < 400) {
      return '☀️';
    } else if (kelvin < 600) {
      return '☔️';
    } else if (kelvin < 700) {
      return '☃️';
    } else if (kelvin < 1000) {
      return '🌫';
    } else if (kelvin == 800) {
      return '☁️s';
    } else if (kelvin <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}