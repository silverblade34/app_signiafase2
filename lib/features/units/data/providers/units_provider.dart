import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

final baseUrl = dotenv.env['LINK_API'];

class UnitsProvider {
  final Dio dioClient = Dio();

  Future<Response> getDestinos() async {
    try {
      final response = await dioClient.get('$baseUrl/general/destino');
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          "${e.response?.data}",
        );
      } else {
        throw Exception("Error de conexión al servidor: ${e.message}");
      }
    } catch (e) {
      throw Exception("Error inesperado: $e");
    }
  }

   Future<Response> getTipoDocumentos() async {
    try {
      final response = await dioClient.get('$baseUrl/general/tipodocumento');
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          "${e.response?.data}",
        );
      } else {
        throw Exception("Error de conexión al servidor: ${e.message}");
      }
    } catch (e) {
      throw Exception("Error inesperado: $e");
    }
  }
}
