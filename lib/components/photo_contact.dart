import 'dart:io';

import 'package:appcall/model/contact_model.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';


class ContactImage extends StatefulWidget {
  const ContactImage({Key? key, required this.contact, this.onTap}) : super(key: key);

  final Contact contact;
  final VoidCallback? onTap;
  static const opacityCurve = Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  @override
  State<ContactImage> createState() => _ContactImageState();
}

class _ContactImageState extends State<ContactImage> {
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    if (widget.contact.pathImage == null){
      return Hero( 
      tag: "contact ${widget.contact.numberPhone}",
      child: Material(
        color: primaryColor,
        child: InkWell(
          onTap: widget.onTap,
          child:  Center(
            child: FittedBox(
              fit:BoxFit.cover,
              child: Text(
                widget.contact.firstName[0].toUpperCase(),
                style:const TextStyle(color: backgroundColor,fontSize: 80),
              ),
            )
          ),
        ),
      ),
      );
    }

    profileImage = File(widget.contact.pathImage!);
    
    return Hero( 
      tag: "contact ${widget.contact.numberPhone}",
      child: Material(child: InkWell(
        onTap: widget.onTap,
        child: SizedBox.expand(child: Image(image: FileImage(profileImage!),fit: BoxFit.cover,))))
      );
      }

     

  }


