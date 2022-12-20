import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:todo/modle/item_dm.dart';
import 'package:todo/providers/listprovider.dart';
import 'package:todo/utils/constants.dart';

class AddBottomSheet extends StatefulWidget {
  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
 late ListProvider listProvider;
  DateTime selectedDate=DateTime.now();
  String title="";
  String discrption="";
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    listProvider=Provider.of(context);
    return Form(
      key: mykey,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add new Task",
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            TextFormField(

              decoration: InputDecoration(
                label: Text("enter your task",
                    style: Theme.of(context).textTheme.labelMedium),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (value){
                title=value;
              },
            ),
            TextFormField(
              onChanged: (value){
                discrption=value;
              },
              decoration: InputDecoration(
                label: Text("enter your Description",
                    style: Theme.of(context).textTheme.labelMedium),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(
              height: 12,
            ),
            Text("Select time", style: Theme.of(context).textTheme.displayMedium),
            SizedBox(
              height: 8,
            ),
            InkWell(
                onTap: () {
                  return ShowDatePicker();
                },
                child: Text(
                  "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                )),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                mykey.currentState!.validate();
                onclickadd();
              },
              child: Text("Add"),
            )
          ],
        ),
      ),
    );
  }

  void ShowDatePicker() async{
     selectedDate=await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))) ?? DateTime.now();
     setState(() {
     });
  }

  void onclickadd() {
    if(! mykey.currentState!.validate())return;
   var todoCollection= FirebaseFirestore.instance.collection(TodoDm.collectionName);
   var emptyDoc= todoCollection.doc();

     emptyDoc.set(
     {
       titleKey  :title,
       discrptionKey:discrption,
       isDoneKey:false,
       idKey:emptyDoc.id,
       dateTimeKey:selectedDate.millisecondsSinceEpoch,
     }
   ).timeout((Duration(milliseconds: 500)),onTimeout: (){
     listProvider.fetchdatafromfirebase();
       Navigator.pop(context);
     });


  }
}
