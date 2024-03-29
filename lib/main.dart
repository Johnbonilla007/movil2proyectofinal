import 'package:flutter/material.dart';
import 'package:weather_app/pages/detalle_ciudad.dart';
import 'package:weather_app/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/detalle': (BuildContext context) => DetalleCiudad()
      },
    );
  }
}
