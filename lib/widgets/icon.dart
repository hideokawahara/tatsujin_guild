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

class ForwardArrowIcon extends StatelessWidget {
  const ForwardArrowIcon({
    Key? key,
    this.color,
  }) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios,
      color: color ?? Colors.black,
    );
  }
}

class BackArrowIcon extends StatelessWidget {
  const BackArrowIcon({
    Key? key,
    this.color,
  }) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_back_ios_rounded,
      color: color ?? Colors.black,
    );
  }
}

class MoreHorizIcon extends StatelessWidget {
  const MoreHorizIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.more_horiz,
    );
  }
}
