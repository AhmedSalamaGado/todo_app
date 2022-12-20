import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../modle/item_dm.dart';
import '../utils/constants.dart';

class ListProvider extends ChangeNotifier{
  DateTime selectedday = DateTime.now();

  List<TodoDm> todo = [];
  fetchdatafromfirebase() async {
    var collectiondata =
    FirebaseFirestore.instance.collection(TodoDm.collectionName);
    var quary = await collectiondata.get();
    todo = quary.docs.map((docs) {
      var map = docs.data();
      return TodoDm(
          id: map[idKey],
          title: map[titleKey],
          discription: map[discrptionKey],
          time: DateTime.fromMillisecondsSinceEpoch(map[dateTimeKey]),
          isDone: map[isDoneKey]);
    }).toList();
    todo= todo.where((todos) {
      return todos.time.year == selectedday.year &&
          todos.time.month == selectedday.month &&
          todos.time.day == selectedday.day;
    }).toList();
    notifyListeners();
  }
  changeselected(DateTime date){
    selectedday=date;
    notifyListeners();
  }

}