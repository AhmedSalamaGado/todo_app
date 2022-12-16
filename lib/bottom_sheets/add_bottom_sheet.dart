import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AddBottomSheet extends StatefulWidget {
  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      key: mykey,
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
          ),
          TextFormField(
            maxLines: 4,
            minLines: 3,
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
                "16/12/2022",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              )),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              mykey.currentState!.validate();
            },
            child: Text("Add"),
          )
        ],
      ),
    );
  }

  void ShowDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
