import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/ciudad.dart';
import 'package:weather_app/models/detalle.dart';

class CiudadProvider {
  Future<Ciudad> getWeatherState(String city) async {
    // final url =
    //     'https://api.themoviedb.org/3/movie/popular?api_key=bb69387fc3e83a43b3a770c9cb3adecc&language=en-US&page=1';

    //construir url
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=c4e4ec27dfd6e4c6442cc145777c89db';

    //hacer llamada
    final response = await http.get(url);

    final dataResponse = json.decode(response.body);

    // print(dataResponse);

    Ciudad ciudad = Ciudad.fromJson(dataResponse);

    return ciudad;
  }

  Future<List<DetalleCiudad>> getDetalle(String city) async {
    // final url =
    //     'https://api.themoviedb.org/3/movie/popular?api_key=bb69387fc3e83a43b3a770c9cb3adecc&language=en-US&page=1';

    //construir url
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=c4e4ec27dfd6e4c6442cc145777c89db';

    //hacer llamada
    final response = await http.get(url);

    final dataResponse = json.decode(response.body);

    print(dataResponse['list']);

    final detalleciudad = CiudadExtendido.fromJsonList(dataResponse['list']);

    return detalleciudad.items;
  }
}
