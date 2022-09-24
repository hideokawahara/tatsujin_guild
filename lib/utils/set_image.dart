//Packages
import 'dart:io';
import 'package:flutter/material.dart';

Image? setImage(String imageSrc) {
  if (imageSrc.contains('http') || imageSrc.contains('https')) {
    return Image.network(
      imageSrc,
      fit: BoxFit.cover,
    );
  } else if (imageSrc.contains('/')) {
    return Image.file(
      File(imageSrc),
      fit: BoxFit.cover,
    );
  } else {
    return null;
  }
}
