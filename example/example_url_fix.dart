import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  var url = 'wss://hostname.domain/?q=i am a wrong query';
  print(urlFix(url)); // wss://hostname.domain/?q=i%20am%20a%20wrong%20query
}
