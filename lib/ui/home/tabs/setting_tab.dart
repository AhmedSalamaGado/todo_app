import 'package:flutter/material.dart';
import 'package:todo/utils/my_theme_data.dart';

class SettingsTab extends StatelessWidget{
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Container(
             padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
             margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
             child: Text("Language",style:Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.start,)),
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 22,vertical: 10),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text("English",style: Theme.of(context).textTheme.bodyMedium,),
                Spacer(),
                Icon(Icons.arrow_downward,color: mythemedata.primarycolor,),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text("Theme",style:Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.start,)),
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 22,vertical: 10),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text("Light",style: Theme.of(context).textTheme.bodyMedium,),
                Spacer(),
                Icon(Icons.arrow_downward,color: mythemedata.primarycolor,),
              ],
            ),
          )
        ],
      ),

    );
  }
}
