import 'package:flutter/material.dart';
import 'package:weather_app/models/ciudad.dart';
import 'package:weather_app/providers/ciudad_provider.dart';

class CityCard extends StatelessWidget {
  CityCard({Key key}) : super(key: key);

  final provider = new CiudadProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: provider.getWeatherState("La Ceiba, hn"),
        builder: (BuildContext context, AsyncSnapshot<Ciudad> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
              height: 170.0, child: materilizeCity(snapshot.data, context));
        });
  }

  Widget materilizeCity(Ciudad ciudad, BuildContext context) {
    final state = ciudad.main.temp - 273.15;

    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detalle', arguments: ciudad);
        },
        child: ListTile(
            title: Text(ciudad.name),
            subtitle: Text('$state °C'),
            leading: Icon(Icons.wb_cloudy),
            trailing: Container(
                child: Column(
              children: [
                Text(ciudad.main.humidity.toString()),
                Text(ciudad.wind.speed.toString())
              ],
            ))));
  }
}
