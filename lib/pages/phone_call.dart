import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PhoneCall extends StatefulWidget {
  const PhoneCall({Key? key}) : super(key: key);

  @override
  _PhoneCallState createState() => _PhoneCallState();
}

class _PhoneCallState extends State<PhoneCall> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FractionallySizedBox(
        heightFactor: 1,
        widthFactor: 1,
        child: Container(
          margin: const EdgeInsets.fromLTRB(10,50,10,10),
          child: Column(
            children:[ 
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.amberAccent,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.red,
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}