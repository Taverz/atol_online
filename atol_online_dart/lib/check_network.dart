// import 'package:http/http.dart' as httpImport;

import 'dart:io';

class CheckNetworkCustom {
  static Future<bool> checkNetwork() async {
    // try {
    //   /// Ping Yandex from check network )))
    //   final response = await httpImport.post(
    //     Uri.https('dzen.ru'),
    //   );
    //   if (response.statusCode == 200 || response.statusCode == 302) {
    //     return true;
    //   }
    // } catch (e) {
    //   throw Exception('Network connect error');
    //   //  throw Exception('No connect network');
    // }
    return _checkConnection();
  }

  static Future<bool> _checkConnection() async {
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 1));
    bool connect = true;
    try {
      // final check1 = await updateConnectionStatus(await connectivity.checkConnectivity());
      // if (!check1) {
      //   connect = false;
      // } else {
      //   connect = true;
      // }
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      } else {
        connect = false;
      }
      return connect;
    } catch (e) {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connect = true;
      } else {
        connect = false;
      }
      return connect;
    }
  }
}
