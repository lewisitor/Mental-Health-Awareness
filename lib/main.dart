import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mental_health_awareness/ui/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mental_health_awareness/ui/ContactUs.dart';
import 'package:mental_health_awareness/ui/MentalDisorder.dart';
import 'package:mental_health_awareness/ui/Home.dart';
import 'package:mental_health_awareness/ui/AboutUs.dart';
import 'package:mental_health_awareness/service/service_locator.dart';
void main() {
  setupLocator();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Bgcolor, fontFamily: 'Staatliches'),
      home: StartScreen()));
}

class StartScreen extends StatefulWidget{
  @override
 _StartScreenState createState()=>_StartScreenState();

}

class _StartScreenState extends State <StartScreen>{
 // int _selectedIndex=0;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    AboutUs(),
    ContactUs()

  ];

  @override
  Widget build(BuildContext context) {
    //_selectedIndex=0;
    return Scaffold(
      body: Center(

        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Bgcolor, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.white.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: GNav(
                gap: 3,
                activeColor: Colors.white,
                color: Colors.white,
                iconSize: 23,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.globe,
                    text: 'About Us',
                  ),
                  GButton(
                    icon: LineIcons.question,
                    text: 'Contact Us',
                  ),

                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }

}





