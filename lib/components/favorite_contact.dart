import 'package:appcall/components/photo_contact.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:flutter/material.dart';

class FavoriteContact extends StatelessWidget {
  const FavoriteContact({Key? key,required this.contact}) : super(key: key);
  final Contact contact;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:(){} ,
      child: Container(
        width: double.infinity,
        margin:const  EdgeInsets.all(1),
        child: ContactImage(contact: contact),
        ),
    );
  }
}