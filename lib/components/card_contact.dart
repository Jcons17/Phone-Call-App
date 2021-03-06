import 'package:appcall/components/button_phone.dart';
import 'package:appcall/components/photo_contact.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:appcall/pages/contact_view.dart';
import 'package:appcall/pages/hero.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardContact extends StatelessWidget {
  const CardContact({Key? key,required this.contact}) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    String lastName = contact.lastName ?? "";
    return  FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 75,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: greyColor)),        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ClipRect(
                    child: ContactImage(
                      contact:contact,
                      onTap: () {
                        Navigator.push(context, CustomPageRoute(ContactView(contact: contact)));
                      }
                      ),
                  ),
                ),
              )
            ),  
            
            Expanded(
              child: Align(
                alignment: const Alignment(-0.7,1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(contact.firstName + " $lastName", style: const TextStyle(fontSize: 22,color: accentColor,fontWeight: FontWeight.bold),),
                    Text(contact.numberPhone ,style: const TextStyle(fontSize: 18,color: accentColorLight,fontStyle: FontStyle.italic),)
                  ],
                ),
              )
            ),
            AspectRatio(aspectRatio: 1, child: ButtonCall(phoneNumber: contact.numberPhone,))
          ],
        ),

      ),
    );
  }
}