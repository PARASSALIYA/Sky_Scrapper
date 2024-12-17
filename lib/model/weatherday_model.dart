class WetherDayModel {
  String cod;
  int message;
  int cnt;
  List<WeatherList> list;

  WetherDayModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  factory WetherDayModel.fromJson(Map<String, dynamic> json) {
    List l1 = json['list'];
    return WetherDayModel(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: l1.map((e) => WeatherList.fromJson(e)).toList(),
    );
  }
}

class WeatherList {
  int dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  int pop;
  Sys sys;
  DateTime dtTxt;

  WeatherList({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });
  factory WeatherList.fromJson(Map<String, dynamic> json) {
    List l1 = json['weather'];
    return WeatherList(
      dt: json['dt'],
      main: Main.fromJson(json['main']),
      weather: l1.map((e) => Weather.fromJson(e)).toList(),
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: json['pop'],
      sys: Sys.fromJson(json['sys']),
      dtTxt: DateTime.parse(json['dt_txt']),
    );
  }
}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });
  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  double tempKf;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      seaLevel: json['seaLevel'],
      grndLevel: json['grndLevel'],
      humidity: json['humidity'],
      tempKf: json['temp_kf'],
    );
  }
}

class Sys {
  String pod;

  Sys({
    required this.pod,
  });
  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'],
    );
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
      gust: json['gust'],
    );
  }
}
