import 'package:appcall/components/button_keyboard.dart';
import 'package:appcall/components/button_phone.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';

class KeyboardCall extends StatelessWidget {
  const KeyboardCall({Key? key, this.onTapNumbers}) : super(key: key);

  final Function? onTapNumbers;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ...[1,4,7,].map((item) => 
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(3, (index) => 
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: ButtonKeyboard(onTapNumbers: onTapNumbers ,isNumber: true, sign: "${index+item}")
                      ),
                  )
                )
              ],
            ),
          )).toList(),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: const ButtonKeyboard(isNumber: false, sign: "*")
                  ),    
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: const ButtonKeyboard(isNumber: true, sign: "0")
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: const ButtonKeyboard(isNumber: false, sign: "#")
                  ),
                )     
              ],
            ),
          ),
           Expanded(
            flex: 3,
            child:  Center(
              child: FractionallySizedBox(
                widthFactor: 1/3,
                child: Container(
                  alignment: Alignment.center,
                  child: const ButtonCall(iconColor: backgroundColor,bgColor: primaryColor,))
                ),
            )
            )
            
        ],
      ),
    );
  }
}

