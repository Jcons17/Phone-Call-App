 
import 'dart:collection';

import 'package:appcall/database/database_provider.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:appcall/util/maps.dart';
import 'package:flutter/widgets.dart';

class ContactsProvider extends ChangeNotifier{

  
  List<Contact>?  _listContacts;

  List<Contact>  _listContactsFiltered = [];

  get listContacts => _listContacts;

  List<Contact> get listContactsFiltered => _listContactsFiltered;

  Future<List<Contact>> getListContacts() async {
    
    
    await DBprovider.db.database;

    final _contactos = await DBprovider.db.getAllContacts();
    
    _listContacts = _contactos;

    _listContacts!.sort((a,b) => a.firstName.toUpperCase().compareTo(b.firstName.toUpperCase()));

    return _listContacts!;
  }

  Map<String , List<Contact>> getMapContacts(List<Contact> lista ){
    Map<String, List<Contact>> _mapContacts = {};

    for (Contact contact in lista) {
      if (!_mapContacts.containsKey(contact.firstName[0].toUpperCase())){ 
        _mapContacts[contact.firstName[0].toUpperCase()] = [contact];
      }else{
        if(!_mapContacts[contact.firstName[0].toUpperCase()]!.contains(contact)) _mapContacts[contact.firstName[0].toUpperCase()]!.add(contact);
      }
    }
    return _mapContacts;
  }

  void filterListByName(String name) {
    _listContactsFiltered =  _listContactsFiltered + _listContacts!.where((contact) => contact.firstName.toUpperCase().startsWith(name.toUpperCase())).toList();
    //_listContactsFiltered =  _listContactsFiltered + _listContacts!.where((contact) => contact.numberPhone.startsWith(name.toUpperCase())).toList();

    notifyListeners();
  }

  void clearfilterList() {
    _listContactsFiltered.clear();
  }

  void filterContactsByNumber(String number) {

    _listContactsFiltered = _listContacts!.where((contact) => contact.numberPhone.startsWith(number.toUpperCase())).toList(); 
  }

  void filterContactByName(String name) {
    _listContactsFiltered =  _listContacts!.where((contact) => contact.firstName.toUpperCase().startsWith(name.toUpperCase())).toList();
  }

  Future<int> addContactToDataBase(Map<String,String> mapContact) async {
    final id = await DBprovider.db.addContact(mapContact);
    notifyListeners();
    return id;
  }

  Future<int> eliminateContactDatabase(int id) async {
    final state = await DBprovider.db.deleteContact(id);
    notifyListeners();
    return state;
  }

  Future<int> updateContactDatabase(Map<String,String> mapContact, int id) async {
    final state = await DBprovider.db.updateContact(mapContact, id);
    notifyListeners();
    return state;
  }

  Future<int> updatePhotoContactDatabase(String path, int id) async {
    print(path);
    final state = await DBprovider.db.updatePhotoContact(path, id);
    notifyListeners();
    return state;
  }



}