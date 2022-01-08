import 'package:appcall/pages/contacts_page.dart';
import 'package:appcall/pages/favorites.dart';
import 'package:appcall/pages/phone_call.dart';
import 'package:appcall/provider/navigation_provider.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  NavigationProvider? _navigationProvider; 

  int indexPage = 1;

  @override
  Widget build(BuildContext context) {
    
    _navigationProvider =  Provider.of<NavigationProvider>(context);
    final _navigationController = _navigationProvider!.pageController;

    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: primaryColor,
        backgroundColor: greyColor,
        elevation: 2,
        iconSize: 30,
        currentIndex: indexPage,
        onTap:(index) {
          setState(() {
            indexPage = index;
          });
          _navigationProvider!.onIndexNavigation(indexPage);
        }   ,
        items: const [
          BottomNavigationBarItem(label: "Phone Call",icon: Icon(Icons.phone)),
          BottomNavigationBarItem(label: "Contacts",icon: Icon(Icons.contact_phone)),
          BottomNavigationBarItem(label: "Favorites",icon: Icon(Icons.star))
        ],  
      ) ,
      body: PageView(
        onPageChanged: (index){
          setState(() {
            indexPage = index;
          });
        },
        controller: _navigationController,
        children:const [
          PhoneCall(),
          ContactPage(),
          FavoritePage()

        ],

      )
    );
  }
}