import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/widgets/city_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> cities = [
    "La Ceiba, hn",
    "San Pedro Sula, hn",
    "Tela, hn",
    "Danli, hn",
    "Choluteca, hn",
    "Tegucigalpa, hn",
    "Comayagua, hn",
    "Tocoa, hn",
    "Intibucá, hn",
    "La Paz, hn",
    "Puerto Lempira, hn",
    "Roatan, hn",
    "Catacamas, hn",
    "El Progreso, hn",
    "Siguatepeque, hn",
    "Jutiapa, hn",
    "Comayagua, hn"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Container(
        child: ListView(
          children: getCitiesState(),
        ),
      ),
    );
  }

  List<Widget> getCitiesState() {
    return cities.map((city) {
      return Column(
        children: [
          CityCard(cityName: city),
          Divider(),
        ],
      );
    }).toList();
  }
}
