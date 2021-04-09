import 'package:flutter/material.dart';
import 'package:weather_app/models/ciudad.dart';
import 'package:weather_app/providers/ciudad_provider.dart';

class CityCard extends StatelessWidget {
  CityCard({Key key, @required this.cityName}) : super(key: key);

  final cityName;

  final provider = new CiudadProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: provider.getWeatherState(cityName),
        builder: (BuildContext context, AsyncSnapshot<Ciudad> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(child: materilizeCity(snapshot.data, context));
        });
  }

  Widget materilizeCity(Ciudad ciudad, BuildContext context) {
    final state = (ciudad.main.temp - 273.15).round();

    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detalle', arguments: ciudad);
        },
        child: ListTile(
            title: Text(ciudad.name),
            subtitle: Text('$state °C'),
            leading: Image.network(
                'https://www.pngfind.com/pngs/m/32-323842_png-file-thunder-weather-icon-transparent-png.png'),
            trailing: Container(
                child: Column(
              children: [
                Text("Humedad: " + ciudad.main.humidity.toString()),
                Text("Viento :" + ciudad.wind.speed.toString()),
              ],
            ))));
  }
}
