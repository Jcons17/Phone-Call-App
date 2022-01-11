import 'package:appcall/components/photo_contact.dart';
import 'package:appcall/components/text_input_contact.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key, this.contact}) : super(key: key);

  final Contact? contact;

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  Widget buildWithContact(BuildContext context) {
    return  Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              
              children: [
                ContactImage(contact:widget.contact!),
                IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.close,color: greyColor ,)),
                Align(alignment: Alignment.topRight,child: IconButton(onPressed: (){print("save");}, icon: const Icon(Icons.save,color: greyColor ,)))
                
              ],
            )
            ),
          Expanded(
            flex: 6,
            child: FractionallySizedBox(
              widthFactor: 0.6,
              child: ListView(
                shrinkWrap: true,
                children:   [
                    Padding(
                      padding: const EdgeInsets.only(top:12),
                      child: Text("Nombre",style: Theme.of(context).textTheme.bodyText1 ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: TextInputContact(controller: TextEditingController(text: ""),labelString:"Nombre",),
                    ),
                    Text("Apellidos",style: Theme.of(context).textTheme.bodyText1 ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: TextInputContact(controller: TextEditingController(text: ""),labelString:"Apellido",),
                    ),
                    Text("Numero de teléfono",style: Theme.of(context).textTheme.bodyText1 ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: NumberInputContact(controller: TextEditingController(text: ""),labelString:"Numero de telefono",),
                    ),
                    Text("Correo electónico",style: Theme.of(context).textTheme.bodyText1 ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: EmailInputContact(controller: TextEditingController(text: ""),labelString:"Correo electrónico",),
                    )  
                ]
                
              ),
            )
            )
        ],
    );
  }

    Widget buildWithoutContact(BuildContext context) {
    return Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: primaryColor,
              width: double.maxFinite,
              height: double.maxFinite,
              child: Center(
                child: Stack(   
                  fit: StackFit.expand,           
                  children: [
                    const Center(child: Icon(Icons.account_circle,size: 250,color: greyColor,)),
                    Align(alignment: Alignment.topLeft, child: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.close,color: greyColor ,))),
                    Align(alignment: Alignment.topRight,child: IconButton(onPressed: (){print("save");}, icon: const Icon(Icons.save,color: greyColor ,)))
                    
                  ],
                )
              ),
            )
            ),
          Expanded(
            flex: 6,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ListView(
                padding:const  EdgeInsets.all(20),
               // shrinkWrap: true,
                children:   [
                    Text("Nombre",style: Theme.of(context).textTheme.bodyText1 ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: TextInputContact(controller: TextEditingController(text: ""),labelString:"Nombre",),
                    ),
                    Text("Apellidos",style: Theme.of(context).textTheme.bodyText1 ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: TextInputContact(controller: TextEditingController(text: ""),labelString:"Apellido",),
                    ),
                    Text("Numero de teléfono",style: Theme.of(context).textTheme.bodyText1 ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: NumberInputContact(controller: TextEditingController(text: ""),labelString:"Numero de telefono",),
                    ),
                    Text("Correo electónico",style: Theme.of(context).textTheme.bodyText1 ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: EmailInputContact(controller: TextEditingController(text: ""),labelString:"Correo electrónico",),
                    ),
    
                ]
              )
            )
          )
        ],
    );
  }


  @override
  Widget build(BuildContext context) {
    Widget body;
    if (widget.contact == null)  {
      body = buildWithoutContact(context);
    } else{
      body = buildWithContact(context);
    }
    return SafeArea(
      child: Scaffold(
        body: body
        )
      );
  }
}