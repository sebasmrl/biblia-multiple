

import 'package:flutter/material.dart';


class EmptyWrapper extends StatelessWidget {
  final Widget child;

  const EmptyWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}