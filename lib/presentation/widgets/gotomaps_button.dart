import 'package:flutter/material.dart';

import '../../constants/styles.dart';

Widget GotomapsButton(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  _buttontext() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "See Location on Map",
        style: greenstyle,
      ),
    );
  }

  return Container(
      margin: size.width < 480
          ? EdgeInsets.symmetric(vertical: 10)
          : EdgeInsets.symmetric(vertical: 0),
      height: size.width < 480 ? size.height * .2 : size.height * .095,
      width: size.width * .9,
      child: size.width < 480
          ? Column(
              children: [
                Icon(
                  Icons.location_on,
                  size: 50,
                  color: Colors.greenAccent,
                ),
                _buttontext()
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.greenAccent,
                ),
                _buttontext()
              ],
            ));
}
