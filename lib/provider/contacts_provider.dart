import 'dart:collection';

import 'package:appcall/model/contact_model.dart';
import 'package:flutter/widgets.dart';

class ContactsProvider extends ChangeNotifier{

  List<Contact>?  _listContacts;

  final Map<String, List<Contact>> _mapContacts = {};


  Future<List<Contact>?> getListContacts()async {
    _listContacts = [
      Contact(idContact: 0, firstName: "Julio", numberPhone: "6331321328",lastName: "Cons"),
      Contact(idContact: 1, firstName: "Rebeca", numberPhone: "6331321328"),
      Contact(idContact: 2, firstName: "Lenin", numberPhone: "6331321328",),
      Contact(idContact: 0, firstName: "angel", numberPhone: "6331321328",lastName: "Cons"),
      Contact(idContact: 1, firstName: "mario", numberPhone: "6331321328"),
      Contact(idContact: 2, firstName: "stalin", numberPhone: "6331321328",),
      Contact(idContact: 0, firstName: "hitler", numberPhone: "6331321328",lastName: "Cons"),
      Contact(idContact: 1, firstName: "churchil", numberPhone: "6331321328"),
      Contact(idContact: 2, firstName: "Lenin", numberPhone: "6331321328",),
      Contact(idContact: 0, firstName: "Julio", numberPhone: "6331321328",lastName: "Cons"),
      Contact(idContact: 1, firstName: "Rebeca", numberPhone: "6331321328"),
      Contact(idContact: 2, firstName: "Lenin", numberPhone: "6331321328",),
    ];

    _listContacts!.sort((a,b) => a.firstName.toUpperCase().compareTo(b.firstName.toUpperCase()));
    return _listContacts;

  }

  Future<Map<String , List<Contact>>> getMapContacts() async {

    _listContacts ??= (await getListContacts());

    for (var contact in _listContacts!) {
        if (!_mapContacts.containsKey(contact.firstName[0].toUpperCase())){ 
        _mapContacts[contact.firstName[0]] = [contact];
        }else{
          if(!_mapContacts[contact.firstName[0]]!.contains(contact)) _mapContacts[contact.firstName[0]]!.add(contact);
        }
    }



    return _mapContacts;
  }



}