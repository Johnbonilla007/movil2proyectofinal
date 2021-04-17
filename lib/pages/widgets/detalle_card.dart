import 'package:flutter/material.dart';
import 'package:weather_app/models/detalle.dart';
import 'package:weather_app/providers/ciudad_provider.dart';

class DetalleCard extends StatelessWidget {
  DetalleCard({Key key, @required this.cityName}) : super(key: key);

  final cityName;

  final provider = new CiudadProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: provider.getDetalle(cityName),
        builder: (BuildContext context,
            AsyncSnapshot<List<DetalleCiudad>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(children: materilizeDetalle(snapshot.data, context));
        });
  }

  List<Widget> materilizeDetalle(
      List<DetalleCiudad> ciudadItems, BuildContext context) {
    // final state = (ciudad.main.temp - 273.15).round();

    return ciudadItems
        .map((ciudad) => GestureDetector(
                child: Card(
              elevation: 1.0,
              child: ListTile(
                  title: Text(ciudad.dtTxt.toString()),
                  subtitle: Text('${(ciudad.main.temp - 273.15).round()}°C'),
                  leading:
                      Image(image: AssetImage(getStringIcon(ciudad.main.temp))),
                  trailing: Container(
                      child: Column(
                    children: [
                      Text("Humedad: " + ciudad.main.humidity.toString()),
                      Text("Viento :" + ciudad.wind.speed.toString()),
                    ],
                  ))),
            )))
        .toList();
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
