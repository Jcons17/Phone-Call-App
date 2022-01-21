import 'package:flutter/widgets.dart';

class CallProvider extends ChangeNotifier{

  TextEditingController editingControllerNumber = TextEditingController(text: "");


  void onTapNumberKeyboard(String value){
    int baseOffSet = editingControllerNumber.selection.baseOffset;
    int extent = editingControllerNumber.selection.extentOffset;
    String text = editingControllerNumber.text;

    if(baseOffSet == -1 && extent == -1){
      editingControllerNumber.text += value;
    }
    else{
      if (baseOffSet == extent) {
        editingControllerNumber.text =text.substring(0,baseOffSet) + value + text.substring(baseOffSet);
        editingControllerNumber.selection = TextSelection(baseOffset: baseOffSet +1 , extentOffset: extent+1); 
      }
      else{
        editingControllerNumber.text = text.substring(0,baseOffSet) + value + text.substring(extent);
        editingControllerNumber.selection = TextSelection(baseOffset: baseOffSet +1 , extentOffset: baseOffSet+1); 
      }
    }
    notifyListeners();
  }

  void onTapDeleteNumber(){
    int baseOffSet = editingControllerNumber.selection.baseOffset;
    int extent = editingControllerNumber.selection.extentOffset;
    String text = editingControllerNumber.text;

    if(baseOffSet == -1 && extent == -1){
      if(text !="") {
        editingControllerNumber.text = text.substring(0,text.length-1);
        }
    }else{
      if(baseOffSet == extent){
        if (baseOffSet !=0){ 
          editingControllerNumber.text =text.substring(0,baseOffSet-1) + text.substring(baseOffSet);
          editingControllerNumber.selection = TextSelection(baseOffset: baseOffSet-1  , extentOffset: baseOffSet-1); 
        } 
      }
      else{
        editingControllerNumber.text = text.substring(0,baseOffSet) + text.substring(extent);
        editingControllerNumber.selection = TextSelection(baseOffset: baseOffSet, extentOffset: baseOffSet); 

      }
    }




  }

}