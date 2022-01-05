import 'package:flutter/material.dart';

class ListContacts extends StatelessWidget{
  const ListContacts({Key? key, required this.widgets}) : super(key: key);

  final List widgets;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (context,index){
            return Container(height: 100,width: double.infinity,color: widgets[index]);
          },
          childCount: widgets.length
        ),
        
      ),
    );

    
  }

}