import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class Utils {
  static Future<bool> tieneConexionInternet() async {
    final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      // No hay conexión Wi-Fi ni de datos móviles
      return false;
    }

    // Verificar si realmente puede acceder a internet
    try {
      final result = await http.get(Uri.parse(
          'https://www.google.com')).timeout(const Duration(seconds: 3));
      return result.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}