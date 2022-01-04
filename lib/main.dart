import 'package:appcall/pages/navigation.dart';
import 'package:appcall/provider/navigation_provider.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp( const CallApp());

class CallApp extends StatelessWidget {
  const CallApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,   
        theme: ThemeData(
          backgroundColor: backgroundColor,
          textTheme:const TextTheme(bodyText1: TextStyle(color: primaryColor,fontSize: 16)) 
        ),
        title: 'Material App',
        initialRoute: "navigation",
        routes: {
          "navigation" : (context) => const Navigation()
        },
      ),
    );
  }
}