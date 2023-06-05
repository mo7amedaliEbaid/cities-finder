import 'package:flutter/material.dart';
import 'package:untitled/presentation/widgets/mytextfield_widget.dart';

class SearchLocationScreen extends StatelessWidget {
  SearchLocationScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
