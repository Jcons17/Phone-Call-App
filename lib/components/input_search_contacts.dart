import 'package:appcall/model/contact_model.dart';
import 'package:appcall/provider/contacts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchContacts extends StatelessWidget {
  const SearchContacts({Key? key,required this.bgColor,required this.labelColor, this.onChange ,this.listContacts}) : super(key: key);

  final Color bgColor;
  final Color labelColor;
  final List<Contact>? listContacts;
  final Function? onChange; 


  @override
  Widget build(BuildContext context) {
    final ContactsProvider _contactProvider = Provider.of<ContactsProvider>(context,listen: false); 
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        cursorColor: labelColor,
        style: Theme.of(context).textTheme.subtitle2,
        onChanged: (value){
          _contactProvider.filterListByName(value);
        },
        
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          icon: Icon(Icons.search,color: labelColor,size: 24  ,),
          labelText: "Search contacts",
          labelStyle: TextStyle(color: labelColor,fontSize: 20),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: InputBorder.none, 
        )
      ),
    );
  }
}