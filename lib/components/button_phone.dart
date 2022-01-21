import 'package:appcall/pages/call_page.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';

class ButtonCall extends StatelessWidget {
  const ButtonCall({Key? key, this.bgColor = backgroundColor, this.iconColor = primaryColor, this.phoneNumber }) : super(key: key);
  final Color bgColor;
  final Color iconColor;
  final String? phoneNumber;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(phoneNumber);
        if(!(phoneNumber == null || phoneNumber == "")){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
            CallPage(numberPhone: phoneNumber!)
            ));
        }    
      }, 
      child: Ink(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: bgColor,),
        child: Center(
          child: Icon(
            Icons.phone,
            color: iconColor,),
        ),
      )
        
    );
  }
}