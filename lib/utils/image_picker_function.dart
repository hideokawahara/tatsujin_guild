//Packages
import 'package:image_picker/image_picker.dart';
import 'dart:io';

Future<File?> getPhotoFromLibrary() async {
  final picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    return File(image.path);
  } else {
    return null;
  }
}

Future<File?> getPhotoFromCamera() async {
  final picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.camera);
  if (image != null) {
    return File(image.path);
  } else {
    return null;
  }
}
