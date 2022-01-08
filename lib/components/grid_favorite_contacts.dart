import 'package:appcall/components/favorite_contact.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:flutter/widgets.dart';

class GridFavoritesContacts extends StatefulWidget {
  const GridFavoritesContacts({
    Key? key,
    required this.listContacts
  }) : super(key: key);

  final List<Contact> listContacts;

  @override
  State<GridFavoritesContacts> createState() => _GridFavoritesContactsState();
}

class _GridFavoritesContactsState extends State<GridFavoritesContacts> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1,
      children: widget.listContacts.map((contact) => FavoriteContact(contact: contact)).toList(),
      
    );
  }
}