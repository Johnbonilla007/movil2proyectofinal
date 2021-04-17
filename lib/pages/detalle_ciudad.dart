import 'package:flutter/material.dart';
import 'package:weather_app/models/ciudad.dart';
import 'package:weather_app/models/detalle.dart';
import 'package:weather_app/pages/widgets/detalle_card.dart';
import 'package:weather_app/providers/ciudad_provider.dart';

class DetalleCiudad extends StatelessWidget {
  DetalleCiudad({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Ciudad ciudad = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Pronóstico Extendido de ${ciudad.name}'),
        ),
        body: DetalleCard(
          cityName: ciudad.name,
        ));
  }

  // SliverAppBar customAppBar() => SliverAppBar(
  //       backgroundColor: Colors.indigo,
  //       expandedHeight: 250.0,
  //       snap: true,
  //       elevation: 3.0,
  //       floating: true,
  //       pinned: true,
  //     );
}
