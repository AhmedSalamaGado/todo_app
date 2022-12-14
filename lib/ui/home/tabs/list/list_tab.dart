import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/modle/item_dm.dart';
import 'package:todo/ui/home/tabs/list/todo_item.dart';

class ListTab extends StatelessWidget{
  DateTime selectedday=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedday,
          firstDate: selectedday.subtract(Duration(days: 365)),
          lastDate: selectedday.add(Duration(days: 365)),
          onDateSelected: (date) => selectedday!=date,
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.black26,
          activeDayColor: Colors.black,
          activeBackgroundDayColor: Colors.white,
          dotsColor: Colors.transparent,
          locale: 'en_ISO',
        ),
        Expanded(child: ListView.builder(
            itemCount: 10,
            itemBuilder:( _ , index) {
              return ToDoItem(TodoDm(title: "Basket ball",discription: "my discription",isDone: false,time: DateTime.now()));
            }))
      ],
    );
  }
}
