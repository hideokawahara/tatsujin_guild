//Packages
import 'package:flutter/material.dart';

class BottomHomeIcon extends StatelessWidget {
  const BottomHomeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.home,
    );
  }
}

class BottomPostIcon extends StatelessWidget {
  const BottomPostIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.post_add,
    );
  }
}

class BottomMyPageIcon extends StatelessWidget {
  const BottomMyPageIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.person,
    );
  }
}
