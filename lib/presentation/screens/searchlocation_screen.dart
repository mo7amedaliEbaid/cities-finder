import 'package:flutter/material.dart';
import 'package:untitled/presentation/widgets/mytextfield_widget.dart';

import 'citylocation_screen.dart';

class SearchLocationScreen extends StatelessWidget {
  SearchLocationScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //print(size.width.toString());
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
            if (constraints.maxWidth < 480) {
              return buildnormalsearchscreen(context, controller);
            } else {
              return buildwidesearchscreen(context, controller);
            }
          },
        ));
  }
}

Widget buildnormalsearchscreen(
    BuildContext context, TextEditingController controller) {
  Size size = MediaQuery.of(context).size;

  return Padding(
    padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
    child: SingleChildScrollView(
      child: Column(
        children: [
          MyTextField(context, controller),
          /*Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: size.height * .06,
            width: size.width * .85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.deepPurple, width: 2)),
            child: TextField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Find A City",
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
            onSubmitted: (searchedforcity){
                searchedforcity=controller.text.toString();
             controller.clear();
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CityLocationScreen(cityname: searchedforcity,)));
            },

            ),
          ),*/
          Container(
            height: size.height * .8,
            width: size.width * .99,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/earth.jpg"),
                    fit: BoxFit.fitHeight)),
          )
        ],
      ),
    ),
  );
}

Widget buildwidesearchscreen(
    BuildContext context, TextEditingController controller) {
  Size size = MediaQuery.of(context).size;

  return Padding(
    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
    child: SingleChildScrollView(
      child: Column(
        children: [
          MyTextField(context, controller),
          /*Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: size.height * .1,
            width: size.width * .7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.deepPurple, width: 2)),
            child: TextField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Find A City",
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
            ),
          ),*/
          Container(
            height: size.height * .75,
            width: size.width * .99,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/earth.jpg"),
                    fit: BoxFit.fitWidth)),
          )
        ],
      ),
    ),
  );
}
