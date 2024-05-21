// import 'dart:convert';
import 'dart:io';

Future<String> fixture(String filePath) async {
  var input = await File(filePath).readAsString();
  // var map = jsonDecode(input);
  return input;
}