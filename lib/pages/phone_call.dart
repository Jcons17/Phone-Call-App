import 'package:appcall/components/keyboard_call.dart';
import 'package:appcall/components/list_contacts.dart';
import 'package:appcall/pages/contact_view.dart';
import 'package:appcall/provider/call_provider.dart';
import 'package:appcall/provider/contacts_provider.dart';
import 'package:appcall/util/color.dart';
import 'package:appcall/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneCall extends StatefulWidget {
  const PhoneCall({Key? key}) : super(key: key);

  @override
  _PhoneCallState createState() => _PhoneCallState();
}

class _PhoneCallState extends State<PhoneCall> {

  @override
  Widget build(BuildContext context) {

    CallProvider _callProvider = Provider.of<CallProvider>(context);
    ContactsProvider _contactProvider = Provider.of<ContactsProvider>(context);

      _callProvider.editingControllerNumber.addListener((){
        _contactProvider.filterContactsByNumber(_callProvider.editingControllerNumber.text);
        
        if(_callProvider.editingControllerNumber.text == ""){
          setState(() {
            _contactProvider.listContactsFiltered.clear();
          });
        }
      });

    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          }      
        },
      child: SafeArea(
        child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: Container(
            margin: const EdgeInsets.fromLTRB(10,0,10,10),
            child: Column(
              children:[ 
                Expanded(
                  flex: 4,
                  child: Scrollbar(child: SingleChildScrollView(child: ListContacts(contactos: _contactProvider.listContactsFiltered))),
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.more_vert,color: accentColor,),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => ContactView(number:_callProvider.editingControllerNumber.text )));
                          },
                        ),
                        Expanded(
                          child: Center(
                            child: TextField(
                              controller: _callProvider.editingControllerNumber,
                              onChanged: (value){
                              },
                              showCursor: true,
                              readOnly: true,
                              cursorColor: accentColorLight,
                              decoration: const InputDecoration(border:InputBorder.none ),
                              textAlign: TextAlign.center,
                              style: numberPhoneCall,
                            ),
                          ),
                        ),
                  
                        IconButton(
                          icon: const Icon(Icons.keyboard_arrow_left,color: accentColor) ,
                          onPressed: (){
                            _callProvider.onTapDeleteNumber();
                          }
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.black26))
                    ),
                    child: KeyboardCall(onTapNumbers: _callProvider.onTapNumberKeyboard,)
                    )
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}