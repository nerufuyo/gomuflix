import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  if (dir.endsWith('gomutv')) {
    return File('$dir/test/$name').readAsStringSync();
  }
  if (dir.endsWith('gomumovie')) {
    return File('$dir/test/$name').readAsStringSync();
  }

  return File('$dir/test/$name').readAsStringSync();
}
