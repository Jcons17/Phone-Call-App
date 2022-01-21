import 'package:appcall/components/photo_contact.dart';
import 'package:appcall/components/text_input_contact.dart';
import 'package:appcall/model/contact_model.dart';
import 'package:appcall/provider/contacts_provider.dart';
import 'package:appcall/util/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key, this.contact,this.number}) : super(key: key);

  final Contact? contact;
  final String? number;

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  Map<String,TextEditingController>? mapInputs; 
  
  bool didChange = false;

  @override
  void initState() {
    super.initState();
    mapInputs = {
      "firstName": TextEditingController(text: widget.contact?.firstName ?? ""),
      "lastName" : TextEditingController(text: widget.contact?.lastName ?? ""),
      "numberPhone": TextEditingController(text: widget.contact?.numberPhone ?? widget.number ?? ""),
      "email": TextEditingController(text: widget.contact?.email ?? ""),
    };

    mapInputs!["firstName"]!.addListener(() { 
      didChange = true;
    });

    mapInputs!["lastName"]!.addListener(() { 
      didChange = true;
    });

    mapInputs!["numberPhone"]!.addListener(() { 
      didChange = true;
    });

    mapInputs!["email"]!.addListener(() { 
      didChange = true;
    });
  }

  Widget body(BuildContext context) {
    return  Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                widget.contact != null ? 
                  ContactImage(contact:widget.contact!) :
                  Container(color:primaryColor, 
                  child: const Center(
                    child:  FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Icon(Icons.account_circle,size: 250,color: greyColor,),
                    ),
                  )),
                IconButton(
                onPressed: ()async{
                  await alertExit(context);
                  }, icon: const Icon(Icons.close,color: greyColor ,)),
                saveButton(context),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    highlightColor: backgroundColor,
                  onPressed: (){_pickedImage();},
                  icon: const Icon(Icons.photo_camera_front_outlined,color: greyColor ,)),
                ),
                
                
              ],
            )
            ),
          Expanded(
            flex: 6,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ListView(
                shrinkWrap: true,
                children:   [
                    Padding(
                      padding: const EdgeInsets.only(top:12),
                      child: Text("Nombre",style: Theme.of(context).textTheme.bodyText1 ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: TextInputContact(controller: mapInputs!["firstName"]!,labelString:"Nombre",),
                    ),
                    Text("Apellidos",style: Theme.of(context).textTheme.bodyText1 ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: TextInputContact(controller: mapInputs!["lastName"]!,labelString:"Apellido",),
                    ),
                    Text("Numero de teléfono",style: Theme.of(context).textTheme.bodyText1 ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: NumberInputContact(controller: mapInputs!["numberPhone"]!,labelString:"Numero de telefono",),
                    ),
                    Text("Correo electónico",style: Theme.of(context).textTheme.bodyText1 ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,10),
                      child: EmailInputContact(controller: mapInputs!["email"]!,labelString:"Correo electrónico",),
                    )  
                ]
              ),
            )
            )
        ],
    );
  }

  Future<void> alertExit(BuildContext context) async {
    if(!didChange){
      Navigator.pop(context);
    }else{
    final response = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => 
        AlertDialog(
          title: const Text('¿Seguro que quieres salir?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Salir'),
            ),
          ],
        ),
      );
      if(response!){ 
        Navigator.pop(context); 
      }
    }
  }

  void _pickedImage() {
   showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
         content: const Text("Choose image source"),
         actions: [
            TextButton(
               child: const Text("Camera"), 
               onPressed: () => Navigator.pop(context, ImageSource.camera),
            ),
            TextButton(
               child: const Text("Galería"), 
               onPressed: () => Navigator.pop(context, ImageSource.gallery),
            ),
         ]
      ),
   ).then((ImageSource? source) async {
      if (source != null) {
        final pickedFile = await ImagePicker().pickImage(source: source);
        final responseInt = pickedFile != null 
          ? await Provider.of<ContactsProvider>(context,listen: false).updatePhotoContactDatabase(pickedFile.path, widget.contact!.idContact!)
          : -1;
        print(responseInt);  
        if(!responseInt.isNegative) setState(() => widget.contact!.pathImage = pickedFile!.path);
      }
  });
} 

  showConfirmationModal(context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        );
      }
    );
  }

  Align saveButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: (){
          handlerSubmit(context);
        },
        icon: const Icon(Icons.save,color: greyColor ,)));
  }

  void handlerSubmit(BuildContext context) {
    final Map<String,String> mapAdd = mapInputs!.map((key, value) => MapEntry(key, value.text));
    if(widget.contact == null){
      Provider.of<ContactsProvider>(context,listen: false).addContactToDataBase(mapAdd);
    }else{
      Provider.of<ContactsProvider>(context,listen: false).updateContactDatabase(mapAdd,widget.contact!.idContact!);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(context)
        )
      );
  }
}