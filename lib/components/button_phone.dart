import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';

class ButtonCall extends StatelessWidget {
  const ButtonCall({Key? key, this.bgColor = backgroundColor, this.iconColor = primaryColor }) : super(key: key);
  final Color bgColor;
  final Color iconColor;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //TODO: Make Function the botton 
        print("Tap");
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