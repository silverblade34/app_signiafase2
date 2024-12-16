import 'package:app_signiafase2/features/home/data/dtos/requestexit_dto.dart';
import 'package:app_signiafase2/features/home/data/providers/home_provider.dart';

class HomeRepository {
  HomeProvider homeProvider = HomeProvider();

   Future<List<RequestExitDto>> getBaselistaesperaDay(String baseId, String date) async {
    final response = await homeProvider.getBaselistaesperaDay(baseId, date);
    
    if (response.data == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.statusCode == 400) {
      throw Exception("Error desconocido");
    } else if (response.statusCode == 404) {
      throw Exception(response.data);
    }
    
    final body = response.data as List;
    List<RequestExitDto> data = body.map((item) => RequestExitDto.fromJson(item)).toList();
    return data;
  }
}