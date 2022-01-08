import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputContact extends StatelessWidget {
  const TextInputContact({Key? key,
  this.bgColor = primaryColorLight, 
  this.labelColor = primaryColor,
  this.labelString,
  required this.controller
  }) : super(key: key);

  final Color? bgColor;
  final Color? labelColor;
  final String? labelString;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: labelColor,
        style: Theme.of(context).textTheme.subtitle2,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          icon: Icon(Icons.account_circle ,color: labelColor,size: 24  ,),
          labelText: labelString,
          labelStyle: TextStyle(color: labelColor,fontSize: 16),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: InputBorder.none, 
        )
      ),
    );
  }
}

class NumberInputContact extends StatelessWidget {
  const NumberInputContact({Key? key,
  this.bgColor = primaryColorLight, 
  this.labelColor = primaryColor,
  this.labelString,
  required this.controller
  }) : super(key: key);

  final Color? bgColor;
  final Color? labelColor;
  final String? labelString;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: labelColor,
        style: Theme.of(context).textTheme.subtitle2,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,

        ],
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          icon: Icon(Icons.phone_android,color: labelColor,size: 24  ,),
          labelText: labelString ?? "",
          labelStyle: TextStyle(color: labelColor,fontSize: 16),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: InputBorder.none, 
        )
      ),
    );
  }
}

class EmailInputContact extends StatelessWidget {
  const EmailInputContact({Key? key,
  this.bgColor = primaryColorLight, 
  this.labelColor = primaryColor,
  this.labelString,
  required this.controller
  }) : super(key: key);

  final Color? bgColor;
  final Color? labelColor;
  final String? labelString;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: labelColor,
        style: Theme.of(context).textTheme.subtitle2,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          icon: Icon(Icons.email_outlined,color: labelColor,size: 24  ,),
          labelText: labelString,
          labelStyle: TextStyle(color: labelColor,fontSize: 16),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: InputBorder.none, 
        )
      ),
    );
  }
}