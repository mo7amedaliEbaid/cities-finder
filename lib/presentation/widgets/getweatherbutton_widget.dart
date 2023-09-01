import 'package:flutter/material.dart';

import '../../constants/styles.dart';

Widget GetWeatherButton(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  _buildbuttontext() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "View Today's Weather",
        style: greenstyle,
      ),
    );
  }

  return Container(
      margin: size.width < 480
          ? EdgeInsets.symmetric(vertical: 20)
          : EdgeInsets.symmetric(vertical: 0),
      height: size.width < 480 ? size.height * .24 : size.height * .095,
      width: size.width * .9,
      child: size.width < 480
          ? Column(
              children: [
                Expanded(
                  child: Container(
                    height: size.height * .2,
                    width: size.width * .9,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/weather.png"),
                            fit: BoxFit.contain)),
                  ),
                ),
                 _buildbuttontext()
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 188.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      //  margin: EdgeInsets.symmetric(vertical: 50),
                      height: size.height * .1,
                      width: size.width * .1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/weather.png"),
                              fit: BoxFit.fitHeight)),
                    ),
                  ),
                  _buildbuttontext()
                ],
              ),
            ));
}
