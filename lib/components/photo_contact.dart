import 'package:appcall/components/splash_effect.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactImage extends StatelessWidget {
  const ContactImage({Key? key, required this.contact, this.onTap}) : super(key: key);

  final Contact contact;
  final VoidCallback? onTap;
  static const opacityCurve = Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);


  

  @override
  Widget build(BuildContext context) {


    if (contact.pathImage == null){
      return Hero( 
      tag: "contact ${contact.numberPhone}",
      child: Material(
        color: primaryColor,
        child: InkWell(
          onTap: onTap,
          child:  Center(
            child: FittedBox(
              fit:BoxFit.cover,
              child: Text(
                contact.firstName[0].toUpperCase(),
                style:const TextStyle(color: backgroundColor,fontSize: 50),
              ),
            )
          ),
        ),
      ),
      );
    }
    return Container();
  }
}

