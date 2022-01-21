import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyContacts extends StatelessWidget {
  const EmptyContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text("No hay contactos", style: Theme.of(context).textTheme.bodyText1),
    );
  }
}