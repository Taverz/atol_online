// import 'package:atol_online_dart/atol_online_dart.dart' as atol_online_dart;
import 'package:atol_online_dart/check_network.dart';

void main(List<String> arguments) async {
  // print('Hello world: ${atol_online_dart.calculate()}!');
  final networkConnect = await CheckNetworkCustom.checkNetwork();
  print(networkConnect);
}
