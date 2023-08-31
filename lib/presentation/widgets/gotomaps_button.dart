import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

Widget GotomapsButton(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
      margin: size.width < 480
          ? EdgeInsets.symmetric(vertical: 20)
          : EdgeInsets.symmetric(vertical: 0),
      height: size.width < 480 ? size.height * .2 : size.height * .095,
      width: size.width * .9,
      child: size.width < 480
          ? Column(
        children: [
          Icon(Icons.location_on,size: 50,color: Colors.greenAccent,),
          /*Container(
            height: size.height * .2,
            width: size.width * .9,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/weather.png"),
                    fit: BoxFit.contain)),
          ),*/
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "See Location on Map",
              style: greenstyle,
            ),
          ),
        ],
      )
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 188.0),
        child: Row(
          children: [
            Container(
              //  margin: EdgeInsets.symmetric(vertical: 50),
              height: size.height * .1,
              width: size.width * .1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/weather.png"),
                      fit: BoxFit.fitHeight)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "View Today's Weather",
                style: greenstyle,
              ),
            ),
          ],
        ),
      ));
}
