import 'package:at/check.dart';
import 'package:at/help.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    help();
    return;
  }
  final cmd = arguments.first;
  switch (cmd) {
    case 'check':
      check(arguments.sublist(1));
    case 'help':
      help();
    case 'version':
      print('0.0.1');
    default:
      help();
  }
}
