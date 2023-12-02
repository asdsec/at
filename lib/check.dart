import 'dart:developer';
import 'dart:io';

import 'package:at/help.dart';

void check(List<String> flags) {
  if (flags.isEmpty) {
    print('error: Provide a flag.\n\n');
    return;
  }
  final flag = flags.first;
  return switch (flag) {
    'header' => _header(),
    'help' => help(),
    _ => print('error: unknown flag'),
  };
}

void _header() {
  final dir = Directory.current;
  final files = <String>['${dir.path}\\at.c'];
  // ignore: cascade_invocations
  for (final file in files) {
    final f = File(file);
    final lines = f.readAsLinesSync();
    final line = lines[5];
    var name = line.substring(9);
    var i = 0;
    while (name[i] != ' ') {
      i++;
    }
    name = name.substring(0, i);
    final n1 = lines[7].substring(37, 37 + i);
    final n2 = lines[8].substring(37, 37 + i);
    if (n1 != name || n2 != name) {
      print('error: header name mismatch');
      return;
    } else {
      print('valid header');
    }
  }
}
