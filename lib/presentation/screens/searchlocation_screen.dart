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

  return SingleChildScrollView(
    child: Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("screen_shots/world3.jpg"),
                  fit: BoxFit.fitHeight)),
        ),
        Positioned(
            top: size.height * .2,
            left: size.width * .07,
            right: size.width * .07,
            child: MyTextField(context, controller)),
      ],
    ),
  );
}

Widget buildwidesearchscreen(
    BuildContext context, TextEditingController controller) {
  Size size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    child: Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("screen_shots/world3.jpg"), fit: BoxFit.fitWidth)),
        ),
        Positioned(
            top: size.height * .12,
            left: size.width * .07,
            right: size.width * .07,
            child: MyTextField(context, controller)),
      ],
    ),
  );
}
