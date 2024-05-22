import 'package:http/http.dart' as httpImport;

class CheckNetworkCustom {
  static Future<bool> checkNetwork() async {
    try {
      final response = await httpImport.post(
        Uri.https('www.yandex.ru'),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {}
    return false;
  }
}
