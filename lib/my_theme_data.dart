import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class mythemedata{

 static Color primarycolor=Color(0xff5D9CEC);
 static Color primarDarkcolor=Color(0xff5D9CEC);
 static Color accentcolor=Color(0xff61E757);
 static Color accentDarkcolor=Color(0xff060E1E);
 static ThemeData lightmode = ThemeData (
  primaryColor: mythemedata.primarycolor,
  accentColor: mythemedata.accentcolor,
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: AppBarTheme(
   titleTextStyle: TextStyle(
       fontSize: 22,
       fontWeight: FontWeight.bold,
       color:Colors.white) ,
   backgroundColor: mythemedata.primarycolor,
   elevation: 0,
  ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
     selectedItemColor: mythemedata.primarycolor,
    ),
   textTheme:TextTheme(
    titleMedium: TextStyle(fontSize:18 ,fontWeight: FontWeight.bold,color: mythemedata.primarycolor),
     titleSmall: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),
   )
 );
 static ThemeData darkMode = ThemeData (
     primaryColor: mythemedata.primarDarkcolor,
     accentColor: mythemedata.accentDarkcolor,
     scaffoldBackgroundColor: Colors.transparent,
     appBarTheme: AppBarTheme(
       titleTextStyle: TextStyle(
           fontSize: 22,
           fontWeight: FontWeight.bold,
           color:Colors.white) ,
       backgroundColor: mythemedata.primarDarkcolor,
       elevation: 0,

     ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: mythemedata.primarDarkcolor,
     ),
     textTheme:TextTheme(
       titleMedium: TextStyle(fontSize:18 ,fontWeight: FontWeight.bold,color: mythemedata.primarDarkcolor),
       titleSmall: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white),
     )
 );


}