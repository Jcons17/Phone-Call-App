import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchContacts extends StatelessWidget {
  const SearchContacts({Key? key,required this.bgColor,required this.labelColor}) : super(key: key);

  final Color bgColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        cursorColor: labelColor,
        style: Theme.of(context).textTheme.subtitle2,
        
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