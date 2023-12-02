void help([String? cmd]) {
  return switch (cmd) {
    'help' => _help(),
    _ => _help(),
  };
}

void _help() {
  print('''
Go is a tool for utilizing 42.

Usage:
    at <command> [arguments]

The commands are:

    help        print this help text
    version     print the version number
''');
}
