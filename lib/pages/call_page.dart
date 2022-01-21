import 'package:appcall/database/database_provider.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.numberPhone }) : super(key: key);

  final String numberPhone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Contact>(
          future: DBprovider.db.getContactByNumberPhone(numberPhone),
          builder: (context, snapshot) {
            print(snapshot.data);
            if(snapshot.data == null) {
              return Text(numberPhone,style: const TextStyle(color: backgroundColor));
            }
            return Text(snapshot.data!.firstName, style: const TextStyle(color: backgroundColor));
          
          }),
      ),
      backgroundColor: accentColor,
    );
  }
}