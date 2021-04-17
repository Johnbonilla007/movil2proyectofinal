import 'package:flutter/material.dart';
import 'package:weather_app/models/ciudad.dart';
import 'package:weather_app/providers/ciudad_provider.dart';
import 'dart:io';

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
        child: Card(
          elevation: 0.5,
          shadowColor: Colors.indigo,
          child: ListTile(
              title: Text(ciudad.name),
              subtitle: Text('$state °C'),
              leading: Image(
                image: AssetImage(getStringIcon(ciudad.main.temp)),
              ),
              trailing: Container(
                  child: Column(
                children: [
                  Text("Humedad: " + ciudad.main.humidity.toString()),
                  Text("Viento :" + ciudad.wind.speed.toString()),
                ],
              ))),
        ));
  }

  String getStringIcon(double temp) {
    if (temp < 300) {
      return 'assets/thunder.png';
    }

    if (temp < 600) {
      return 'assets/rain.png';
    }

    if (temp >= 800) {
      return 'assets/sun.png';
    }

    return 'assets/cloudy.png';
  }
}
