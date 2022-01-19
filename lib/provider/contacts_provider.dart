 
import 'dart:collection';

import 'package:appcall/model/contact_model.dart';
import 'package:appcall/util/maps.dart';
import 'package:flutter/widgets.dart';

class ContactsProvider extends ChangeNotifier{

  
  List<Contact>?  _listContacts;

  List<Contact>  _listContactsFiltered = [];



  final HashMap<String, List<Contact>> _mapContacts = HashMap();

  bool _changeList = false;


  get listContacts => _listContacts;

  List<Contact> get listContactsFiltered => _listContactsFiltered;

  Future<List<Contact>> getListContacts() async {
    _listContacts = [
      Contact(idContact: 0, firstName: "Julio", numberPhone: "6331321328",lastName: "Cons"),
      Contact(idContact: 0, firstName: "Julio", numberPhone: "6331321452",lastName: "Cons"),
      Contact(idContact: 1, firstName: "Rebeca", numberPhone: "35121"),
      Contact(idContact: 2, firstName: "Lenin", numberPhone: "2135",),
    ];

    _listContacts!.sort((a,b) => a.firstName.toUpperCase().compareTo(b.firstName.toUpperCase()));


    return _listContacts!;


  }

  Future<Map<String , List<Contact>>> getMapContacts() async {
    List<Contact> listContacts = [];
    if (_mapContacts.isEmpty){ 
      listContacts = (await getListContacts());
      _mapearContactos(listContacts);
    }else if(_changeList){
      listContacts = _listContactsFiltered;
      _mapContacts.clear();
      _mapearContactos(listContacts);
      _listContactsFiltered.clear();
      _changeList = false;
    }
    return _mapContacts;
  }

  void _mapearContactos(List<Contact> listContacts) {
    for (Contact contact in listContacts) {
      if (!_mapContacts.containsKey(contact.firstName[0].toUpperCase())){ 
        _mapContacts[contact.firstName[0].toUpperCase()] = [contact];
      }else{
        if(!_mapContacts[contact.firstName[0].toUpperCase()]!.contains(contact)) _mapContacts[contact.firstName[0].toUpperCase()]!.add(contact);
      }
    }
  }

  void filterListByNumber(String number) {
    _listContactsFiltered =  _listContactsFiltered + _listContacts!.where((contact) => contact.numberPhone.startsWith(number.toUpperCase())).toList();
  }

  void filterListByName(String name) {
    
    _listContactsFiltered =  _listContactsFiltered + _listContacts!.where((contact) => contact.firstName.toUpperCase().startsWith(name.toUpperCase())).toList();
  }

  void filterContacts(String number) {

    List<List<Contact>>  _listContactsFilteredPhone = [_listContacts!];
    int index = 0;
    for (String letter in number.characters) {
      int numero = int.parse(letter);
      String mapNumero = mapKeyboardNumbers[numero]!;
      List<Contact> flatList = [];
      for(String mapChar in mapNumero.characters){
        var listName =  _listContactsFilteredPhone.last.where((contact) {
              var nameLetter = contact.firstName.toUpperCase();
              var firstLetter = nameLetter.substring(0,index) + mapChar;
              return nameLetter.startsWith(firstLetter);
              }).toList();
        flatList = flatList + listName;
        }
      if(flatList.isNotEmpty) _listContactsFilteredPhone.add(flatList);
      //if(flatList.isEmpty) _listContactsFilteredPhone = [listContacts];

      index = index + 1;
    }    

    _listContactsFilteredPhone[0] = [];

    _listContactsFiltered =  _listContactsFilteredPhone.last; 
  }

  void filterContactByName(String name) {
    _listContactsFiltered =  _listContacts!.where((contact) => contact.firstName.toUpperCase().startsWith(name.toUpperCase())).toList();
  }

  void onUpdateChangeList(bool value){
    _changeList = value;
    notifyListeners();
  }  



}