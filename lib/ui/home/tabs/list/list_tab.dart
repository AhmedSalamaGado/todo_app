import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/modle/item_dm.dart';
import 'package:todo/providers/listprovider.dart';
import 'package:todo/ui/home/tabs/list/todo_item.dart';
import 'package:todo/utils/constants.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
 late ListProvider listProvider;
  Widget build(BuildContext context) {
    listProvider=Provider.of(context);
    if (listProvider.todo.isEmpty) listProvider.fetchdatafromfirebase();
    return Column(
      children: [
        CalendarTimeline(
          initialDate:listProvider. selectedday,
          firstDate:listProvider. selectedday.subtract(Duration(days: 365)),
          lastDate:listProvider. selectedday.add(Duration(days: 365)),

          onDateSelected: (date) {

            listProvider.changeselected(date!);
            listProvider.fetchdatafromfirebase();
            } ,
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.black26,
          activeDayColor: Colors.black,
          activeBackgroundDayColor: Colors.white,
          dotsColor: Colors.transparent,
          locale: 'en_ISO',
        ),
        Expanded(
            child: ListView.builder(
                itemCount: listProvider.todo.length,
                itemBuilder: (_, index) {
                  return ToDoItem(listProvider.todo[index]);
                }))
      ],
    );
  }


}
