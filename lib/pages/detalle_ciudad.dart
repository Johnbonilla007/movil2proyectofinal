import 'package:flutter/material.dart';

class DetalleCiudad extends StatelessWidget {
  const DetalleCiudad({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalle Ciudad'),
        ),
        body: Container(
          child: Text("DetalleCiudad"),
        ));
  }
}
