  import 'package:appcall/components/empty_contacs.dart';
import 'package:appcall/components/input_search_contacts.dart';
import 'package:appcall/components/list_contacts.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:appcall/pages/contact_view.dart';
import 'package:appcall/provider/contacts_provider.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

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
              child: SearchContacts(bgColor: primaryColorLight.withOpacity(0.5), labelColor: primaryColor,)
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => const ContactView() ));
              },
              child: Container(
                width: double.maxFinite,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor) 
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.account_circle_rounded,color: primaryColor,),
                      Text("   Add contact", style: Theme.of(context).textTheme.bodyText1,),
                    ],
                  ),
                ),
              ) ,
            ),
            Expanded(child: 
              FutureBuilder<List<Contact>>(
                future: _contactProvider.getListContacts(),
                builder: (context, snapshot) {

                  if (snapshot.data == null) return const Center(child: CircularProgressIndicator());
                  if (snapshot.data!.isEmpty) return const EmptyContacts();

                  bool conditionListFiltered = _contactProvider.listContactsFiltered.isNotEmpty;
                  var list = conditionListFiltered ? _contactProvider.listContactsFiltered : snapshot.data!;
                  var mapContacts = _contactProvider.getMapContacts(list);

                  return RawScrollbar(
                    thumbColor: primaryColorLight,
                    isAlwaysShown: true,
                    controller: _controller,
                    child: ListView.builder(
                      controller: _controller,
                      physics: const BouncingScrollPhysics(),
                      itemCount: mapContacts.length,
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                              Container(
                                width: 24 ,
                                padding: const EdgeInsets.fromLTRB(5,5,0,0),
                                child: Text(mapContacts.entries.toList()[index].key.toUpperCase(),style: const TextStyle(color: primaryColor, fontSize: 32,fontWeight : FontWeight.bold ) )
                                ),
                              ListContacts(contactos: mapContacts.entries.toList()[index].value),
                            ],
                          );
                      }
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

