import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashEffect extends StatelessWidget {
  final Widget child;
  final Function onTap;

  const SplashEffect({Key? key,required this.child, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: child,
        onTap: onTap(),
      ),
    );
  }
}