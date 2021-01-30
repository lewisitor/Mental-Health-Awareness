import 'package:mental_health_awareness/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_awareness/ui/screensize.dart';
import 'package:mental_health_awareness/service/wave_progress.dart';
import 'package:mental_health_awareness/service/service_locator.dart';
import 'package:mental_health_awareness/service/cell_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Bgcolor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 20,
          top: screenAwareSize(40, context),
        ),
        child: Column(
          children: <Widget>[
            Center(
                child: Text(
                  " You can Contact Us for more Information",
                  style: TextStyle(
                    fontSize: 28,

                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    inherit: true,
                  ),
                )),
            SizedBox(height: 30),
            InkWell(
              child: new Text(
                "Helpline Number",
                style: TextStyle(
                  fontSize: 17,
                  inherit: true,
                  color: Colors.white,
                  letterSpacing: 0.4,
                ),
              ),
            ),
            SizedBox(height: 20),
            vaweCard(
              context,
              "National(Cameroon)",
              "+237676036219",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            SizedBox(height: 30),
            InkWell(
              child: new Text(
                "International Number",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  inherit: true,
                  letterSpacing: 0.4,
                ),
              ),
            ),
            SizedBox(height: 10),
            vaweCard(
              context,
              "Cluck Clank",
              "+971-56-842-7085",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),

            SizedBox(height: 30),
            InkWell(
              child: new Text(
                "WhatsApp Number",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  inherit: true,
                  letterSpacing: 0.4,
                ),
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: _launchURL,
              child: Text('WhatsApp Us'),
            ),

          ],
        ),
      ),
    );
  }


  _launchURL() async {
    const url = 'https://wa.me/971568427085?text=Hello';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  Widget vaweCard(BuildContext context, String name, String fields,
      Color fillColor, Color bgColor) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        right: 20,
      ),
      padding: EdgeInsets.only(left: 15),
      height: screenAwareSize(80, context),
      decoration: BoxDecoration(
        color: Bgcolor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              WaveProgress(
                screenAwareSize(45, context),
                fillColor,
                bgColor,
                95,
              ),
              IconButton(
                icon: Icon(Icons.phone_in_talk),
                color: Colors.white,
                onPressed: () => _service.call(fields),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "$fields",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
