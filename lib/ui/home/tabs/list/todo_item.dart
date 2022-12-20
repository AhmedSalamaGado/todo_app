import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/modle/item_dm.dart';
import 'package:todo/providers/listprovider.dart';
import 'package:todo/utils/my_theme_data.dart';

class ToDoItem extends StatelessWidget {
  late ListProvider listProvider;
  TodoDm todo;
  ToDoItem(this.todo);
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              deleteItem();
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(12),
              width: 3,
              height: 40,
              color: mythemedata.primarycolor,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "${todo.title}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "${todo.discription}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: mythemedata.primarycolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("assets/icon_check.png"),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  void deleteItem() {
    FirebaseFirestore.instance
        .collection(TodoDm.collectionName)
        .doc(todo.id)
        .delete().timeout(Duration(milliseconds: 500),onTimeout: (){
      listProvider.fetchdatafromfirebase();
    });

  }
}
