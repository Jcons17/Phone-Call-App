import 'package:appcall/components/card_contact.dart';
import 'package:appcall/components/photo_contact.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:appcall/pages/contacts_page.dart';
import 'package:flutter/material.dart';

import 'contact_view.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _contacto =
        Contact(firstName: "Julio", idContact: 1, numberPhone: "6331321328");
    return Padding(
          padding: const EdgeInsets.all(15),
          child: AspectRatio(
              aspectRatio: 1,
              child: ClipOval(
                  child: ContactImage(
                      contact: _contacto,
                      onTap: () {
                        Navigator.push(context,
                            CustomPageRoute(ContactView(contact: _contacto)));
                      }))),
        );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
        var _contacto =
        Contact(firstName: "Julio", idContact: 1, numberPhone: "6331321328");
    return Scaffold(
      appBar: AppBar(
        title:const Text("Second Screen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 200,
            child: AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
                    child: ContactImage(
                        contact: _contacto,
                        onTap: () {
                          Navigator.pop(context);
                        }))),

          )
        ],
      )),
    );
  }
}

class CustomPageRoute<T> extends PageRoute<T> {
  final Widget child;

  CustomPageRoute(this.child);

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
