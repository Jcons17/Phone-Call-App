import 'package:appcall/components/card_contact.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:appcall/provider/contacts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListContacts extends StatelessWidget{
  const ListContacts({Key? key, required this.contactos}) : super(key: key);

  final List<Contact> contactos;

  @override
  Widget build(BuildContext context) {  
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          for (var contacto in contactos)
            Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) => Provider.of<ContactsProvider>(context,listen: false).eliminateContactDatabase(contacto.idContact!),
              child: CardContact(contact: contacto)),
        ],
      )
          
    );
  }
} 