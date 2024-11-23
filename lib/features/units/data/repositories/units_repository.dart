import 'package:app_signiafase2/core/dtos/response.dto.dart';
import 'package:app_signiafase2/core/helpers/fetchdata_helper.dart';
import 'package:app_signiafase2/features/units/data/dtos/destino_dto.dart';
import 'package:app_signiafase2/features/units/data/dtos/tipodocumento_dto.dart';
import 'package:app_signiafase2/features/units/data/providers/units_provider.dart';

class UnitsRepository {
  UnitsProvider unitsProvider = UnitsProvider();

  Future<ApiResponse<List<DestinoDto>>> getDestinos() async {
    return fetchData(
      () => unitsProvider.getDestinos(),
      (json) => DestinoDto.fromJson(json),
    );
  }

    Future<ApiResponse<List<TipoDocumentoDto>>> getTipoDocumentos() async {
    return fetchData(
      () => unitsProvider.getTipoDocumentos(),
      (json) => TipoDocumentoDto.fromJson(json),
    );
  }
}
