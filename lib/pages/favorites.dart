import 'package:appcall/components/circular_progress.dart';
import 'package:appcall/components/grid_favorite_contacts.dart';
import 'package:appcall/components/input_search_contacts.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:appcall/provider/contacts_provider.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactsProvider _contactsProvider = Provider.of<ContactsProvider>(context);
    return SafeArea(  
      child: FutureBuilder<List<Contact>>(
        future: _contactsProvider.getListContacts(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return const ProgressCircular();
          return GridFavoritesContacts(listContacts: snapshot.data!,);
        }
      )

      );
  }
}

