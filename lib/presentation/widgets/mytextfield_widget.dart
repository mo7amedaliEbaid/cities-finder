import 'package:flutter/material.dart';

import '../screens/citylocation_screen.dart';

Widget MyTextField(BuildContext context, TextEditingController controller) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: size.width < 480
        ? EdgeInsets.symmetric(horizontal: 10)
        : EdgeInsets.symmetric(horizontal: 20),
    height: size.width < 480 ? size.height * .06 : size.height * .1,
    width: size.width < 480 ? size.width * .85 : size.width * .7,
   /* decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2)),*/
    child: TextField(
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Find A City",
        hintStyle: TextStyle(color: Colors.black),
        border: InputBorder.none,
        fillColor: Colors.white,
        filled: true
      ),
      onSubmitted: (searchedforcity) {
        searchedforcity = controller.text.trim().toString();
        controller.clear();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CityLocationScreen(
                  cityname: searchedforcity,
                )));
      },
    ),
  );
}
