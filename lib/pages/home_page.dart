import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/widgets/city_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Container(
        child: ListView(
          children: [
            CityCard(),
            ListTile(
              title: Text("La Ceiba"),
              subtitle: Text("Temperatura"),
              leading: Icon(Icons.ac_unit),
              trailing: Icon(Icons.access_alarms_rounded),
            )
          ],
        ),
      ),
    );
  }
}
