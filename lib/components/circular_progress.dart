import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressCircular extends StatelessWidget {
  const ProgressCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child:  CircularProgressIndicator(color: primaryColor));
  }
}