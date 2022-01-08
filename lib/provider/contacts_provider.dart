 
import 'package:appcall/model/contact_model.dart';
import 'package:flutter/widgets.dart';

class ContactsProvider extends ChangeNotifier{

  List<Contact>?  _listContacts;

  final Map<String, List<Contact>> _mapContacts = {};


  Future<List<Contact>> getListContacts()async {
    _listContacts = [
      Contact(idContact: 0, firstName: "Julio", numberPhone: "6331321328",lastName: "Cons"),
      Contact(idContact: 1, firstName: "Rebeca", numberPhone: "35121"),
      Contact(idContact: 2, firstName: "Lenin", numberPhone: "2135",),
    ];

    _listContacts!.sort((a,b) => a.firstName.toUpperCase().compareTo(b.firstName.toUpperCase()));


    return _listContacts!;


  }

  Future<Map<String , List<Contact>>> getMapContacts() async {
    
    if (_mapContacts.isNotEmpty) return _mapContacts;

    var listContacts = (await getListContacts());
    for (var contact in listContacts) {
        if (!_mapContacts.containsKey(contact.firstName[0])){ 
        _mapContacts[contact.firstName[0]] = [contact];
        }else{
          if(!_mapContacts[contact.firstName[0]]!.contains(contact)) _mapContacts[contact.firstName[0]]!.add(contact);
        }
    }
    return _mapContacts;
  }



}