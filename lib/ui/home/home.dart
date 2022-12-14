import 'package:flutter/material.dart';
import 'package:todo/ui/home/tabs/list/list_tab.dart';
import 'package:todo/ui/home/tabs/setting_tab.dart';

class Home extends StatefulWidget {
  static String routeName="Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget>tabs=[ListTab(),SettingsTab()];

  int currentindex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
        toolbarHeight:MediaQuery.of(context).size.height*.2,
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){},
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 3
          )
        ),
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape:CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        elevation: 0,

        child: BottomNavigationBar(
          onTap: (index){
            currentindex=index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icon_list.png")),label: "list"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icon_settings.png")),label: "Setting"),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
      body: tabs[currentindex],
    );
  }
}
