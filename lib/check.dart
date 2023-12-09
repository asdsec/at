import 'dart:io';

import 'package:at/help.dart';

void check(List<String> flags) {
  if (flags.isEmpty) {
    print('error: Provide a flag.\n\n');
    return;
  }
  final flag = flags.first;
  final username = flags[1];
  return switch (flag) {
    'header' => _header(username),
    'help' => help(),
    _ => print('error: unknown flag'),
  };
}

List<File> _findFiles() {
  final dir = Directory.current;
  return dir
      .listSync(
        recursive: true,
      )
      .whereType<File>()
      .where(
        (file) => file.path.endsWith('.c') || file.path.endsWith('.h'),
      )
      .toList();
}

bool _isValid({
  required File file,
  required String username,
}) {
  final lines = file.readAsLinesSync();
  final name1 = lines[5].substring(9, 9 + username.length);
  final name2 = lines[7].substring(37, 37 + username.length);
  final name3 = lines[8].substring(37, 37 + username.length);
  return name1 == username && name2 == username && name3 == username;
}

void _header(String username) {
  final files = _findFiles();
  // ignore: cascade_invocations
  files.any((file) => _isValid(file: file, username: username) == false)
      ? print('error: invalid header')
      : print('valid header');
}
