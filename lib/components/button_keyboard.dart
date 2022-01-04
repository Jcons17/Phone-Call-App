import 'package:appcall/util/maps.dart';
import 'package:appcall/util/text_style.dart';
import 'package:flutter/material.dart';

class ButtonKeyboard extends StatelessWidget {
  const ButtonKeyboard({Key? key, required  this.isNumber, required this.sign}) : super(key: key);
  final bool isNumber;
  final String sign;
  
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      radius: 45,
      onTap: (){},
      child: Container(
        child: isNumber 
          ?Center(child: Column(
            children: [
              Expanded(child: Text(sign, style: buttonKeyboardNumber,)),
              Expanded(child: Text(mapKeyboardNumbers[int.parse(sign)].toString(), style: buttonKeyboardNumberMap,)),    
            ],
          )) 
          :Center(child: Text(sign, style: buttonKeyboardNumber,)) 
    
        ),
    );
  }

}