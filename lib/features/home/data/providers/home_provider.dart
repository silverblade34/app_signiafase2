import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

final baseUrl = dotenv.env['LINK_API'];

class HomeProvider {
  Future<Response> getBaselistaesperaDay(String baseId, String date) async {
    try {
      Dio dioClient = Dio();
      final response = await dioClient.get(
        '$baseUrl/reqsalida/baselistaespera/$baseId/$date/',
      );

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