import 'package:flutter/material.dart';
import 'package:mental_health_awareness/ui/MentalDisorder.dart';
import 'package:mental_health_awareness/ui/screensize.dart';
import 'package:mental_health_awareness/ui/ContactUs.dart';
import 'package:mental_health_awareness/ui/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Animation virusBounce;
  Animation shadowFade;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward(from: 0.0);
        }
      });
    virusBounce = Tween(begin: Offset(0.0, 0), end: Offset(0, -20.0))
        .animate(animationController);
    shadowFade = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.4, 1.0), parent: animationController));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Bgcolor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 100, 25, 25),
          child: Center(
            child: Column(
              children: <Widget>[
                Transform.translate(
                  offset: virusBounce.value,
                  child: Image(
                    alignment: Alignment.center,
                    image: AssetImage("assests/Inner-Peace-icon.png"),
                    height: screenAwareSize(190, context),
                    width: screenAwareSize(400, context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),

                ),

                Center(
                  child: Text(
                    'Smart Health',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                MaterialButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MentalDisorder()),
                    );
                  },
                  minWidth: double.infinity,
                  height: 40,
                  child: Text(
                    'Types of Mental Disorder'.toUpperCase(),
                  ),
                  color: Fgcolor,
                  textColor: Colors.white,
                ),


                SizedBox(height: 5),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUs()),
                    );
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  minWidth: double.infinity,
                  height: 40,
                  child: Text(
                    'Contact Us'.toUpperCase(),
                  ),
                  color: Fgcolor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
