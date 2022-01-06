import 'package:appcall/model/contact_model.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/widgets.dart';

class ContactImage extends StatelessWidget {
  const ContactImage({Key? key, required this.contact}) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    if (contact.email == null){
      return Container(
        color: accentColorDark,
        child: Center(
          child: FittedBox(
            fit:BoxFit.cover,
            child: Text(
              contact.firstName[0].toUpperCase(),
              style:const TextStyle(color: backgroundColor,fontSize: 50),
            ),
          )
        ),
      );
    }

    return Container();
  }
}