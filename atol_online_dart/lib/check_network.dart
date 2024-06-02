
import 'package:http/http.dart' as httpImport;

class CheckNetworkCustom {
  static Future<bool> checkNetwork() async {
    try {
      /// Ping Yandex from check network )))
      final response = await httpImport.post(
        Uri.https('dzen.ru'),
      );
      if (response.statusCode == 200 || response.statusCode == 302) {
        return true;
      }
    } catch (e) {
      throw Exception('Network connect error');
      //  throw Exception('No connect network');
    }
    return false;
  }
}
