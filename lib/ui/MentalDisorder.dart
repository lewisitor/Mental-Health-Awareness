import 'package:mental_health_awareness/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class MentalDisorder extends StatefulWidget {
  @override
  _MentalDisorderState createState() => _MentalDisorderState();
}

class _MentalDisorderState extends State<MentalDisorder> {

  SwiperController _swiperController;
  double prevOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
  }

  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> swiperItemsList = [
      buildSwiperItem(
          "assests/Anxiety.png",
          "Anxiety is a feeling of fear, dread, and uneasiness. It might cause you to sweat, feel restless and tense, and have a rapid heartbeat. It can be a normal reaction to stress.",
          Color(0xFFfba457),
          firstGradient,
          "Take Care of Your Body, Limit Alcohol Consumption"),
      buildSwiperItem(
          "assests/Bi-Polar-Disorder.png",
          "Bipolar disorder is a serious mental illness. People who have it go through unusual mood changes. They go from very happy, 'up,' and active to very sad and hopeless, 'down,' and inactive, and then back again. ",
          Color(0xFFffcc00),
          secondtGradient,
          "Avoid triggers such as caffeine, alcohol or drug use, and stress.Eat healthy."),
      buildSwiperItem(
          "assests/Insomia.png",
          "Insomia is a sleep disorder in which people find it difficult to sleep. It can last from 1 night to a few Weeks.",
          Color(0xFFd18cd6),
          thirdGradient,
          "Stick to a sleep schedule, stay active, avoid or limit naps."),
      buildSwiperItem(
          "assests/schizophrenia.png",
          "Schizophrenia is a serious mental disorder people don't really understand. It may result in some combination of hallucinations, delusions and in extreme cases Sucidal thoughts.",
          Color(0xFFd18cd6),
          thirdGradient,
          "Don't Use Drugs, Avoid abusive or Traumatic situations, Keep strong social ties."),
      buildSwiperItem(
          "assests/Depression.png",
          "Depression (major depressive disorder) is a common and serious medical illness that negatively affects how you feel, the way you think and how you act.",
          Color(0xFFd18cd6),
          thirdGradient,
          "Exercise Regularly, Cutback on Social Media, Build strong Social and Family ties."),
    ];
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Bgcolor,
      body: Container(
        color: Bgcolor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Expanded(
              flex: 6,
              child: Swiper(
                controller: _swiperController,
                itemCount: swiperItemsList.length,
                onIndexChanged: (int value) {
                  if (value == 2) {
                    setState(() {
                      prevOpacity = 0.0;
                    });
                  } else {
                    setState(() {
                      prevOpacity = 1.0;
                    });
                  }
                },
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: MediaQuery.of(context).size.height / 1.5,
                itemBuilder: (BuildContext context, index) {
                  return swiperItemsList[index];
                },
                layout: SwiperLayout.TINDER,
                curve: Curves.bounceOut,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwiperItem(String image, String text, Color color,
      Gradient gradient, String endText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.8),
            blurRadius: 4,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: gradient,
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 8),
                        )
                      ]),
                ),
                Image.asset(
                  image,
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.3,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              endText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const firstGradient = LinearGradient(
  colors: [
    Color(0xFFfc792c),
    Color(0xFFfba457),
  ],
);

const secondtGradient = LinearGradient(
  colors: [
    Color(0xFFfeb700),
    Color(0xFFffcc00),
  ],
);

const thirdGradient = LinearGradient(
  colors: [
    Color(0xFFa978ad),
    Color(0xFFd18cd6),
  ],
);
