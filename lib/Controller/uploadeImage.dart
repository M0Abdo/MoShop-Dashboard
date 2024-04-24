// ignore_for_file: file_names

import 'dart:io';

import 'package:file_picker/file_picker.dart';

uploadImage([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "jpeg", "gif"]);

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
