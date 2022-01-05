import 'package:appcall/components/card_contact.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:flutter/material.dart';

class ListContacts extends StatelessWidget{
  const ListContacts({Key? key, required this.contactos}) : super(key: key);

  final List<Contact> contactos;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (context,index){
            return Container(
              margin: const EdgeInsets.only(bottom: 6),
              child: CardContact(contact: contactos[index]),
            );
          },
          childCount: contactos.length
        ),
        
      ),
    );

    
  }

}