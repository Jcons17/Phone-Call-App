import 'package:appcall/components/empty_contacs.dart';
import 'package:appcall/components/input_search_contacts.dart';
import 'package:appcall/components/list_contacts.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:appcall/provider/contacts_provider.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  List<Contact> listContacts = [
    Contact(idContact: 0, firstName: "Julio", numberPhone: "6331321328",lastName: "Cons"),
    Contact(idContact: 1, firstName: "Rebeca", numberPhone: "6331321328"),
    Contact(idContact: 2, firstName: "Lenin", numberPhone: "6331321328",),

  ];

  final List<Color> colors = [
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.pink,
  ];
  final _controller = ScrollController();


  @override
  Widget build(BuildContext context) {
    final ContactsProvider _contactProvider = Provider.of<ContactsProvider>(context);
    return Scaffold(
      body: SafeArea(child: 
        Column(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SearchContacts(bgColor: primaryColorLight.withOpacity(0.5), labelColor: primaryColor)
            ),
            Expanded(child: 
              FutureBuilder<Map<String,List<Contact>>>(
                future: _contactProvider.getMapContacts(),
                builder: (context, snapshot) {

                  if (snapshot.data == null) return const Center(child: CircularProgressIndicator());
                  return ScrollbarTheme(
                    data: const ScrollbarThemeData( minThumbLength: 10),
                    child: RawScrollbar(
                      thumbColor: primaryColorLight,
                      isAlwaysShown: true,
                      controller: _controller,
                      child: ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                                Container(
                                  width: 24 ,
                                  padding: const EdgeInsets.fromLTRB(5,5,0,0),
                                  child: FittedBox(child: Text(snapshot.data!.entries.toList()[index].key.toUpperCase(),style: const TextStyle(color: primaryColor, fontSize: 32,fontWeight : FontWeight.bold ) ))
                                  ),
                                ListContacts(contactos: snapshot.data!.entries.toList()[index].value),
                              ],
                            );
                        }
                        ),
                    ),
                  );
                }
              )
            )
            
          ],
        )
      ),
    );
  }
}

