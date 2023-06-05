import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

Widget GetWeatherButton(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
      margin: size.width < 480
          ? EdgeInsets.symmetric(vertical: 50)
          : EdgeInsets.symmetric(vertical: 5),
      height: size.width < 480 ? size.height * .25 : size.height * .2,
      width: size.width * .9,
      child: size.width < 480
          ? Column(
              children: [
                Container(
                  height: size.height * .2,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/weather.png"),
                          fit: BoxFit.contain)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 1),
                  child: Text(
                    "View Today's Weather",
                    style: greenstyle,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  //  margin: EdgeInsets.symmetric(vertical: 50),
                  height: size.height * .18,
                  width: size.width * .4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/weather.png"),
                          fit: BoxFit.contain)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 1),
                  child: Text(
                    "View Today's Weather",
                    style: greenstyle,
                  ),
                ),
              ],
            ));
}
