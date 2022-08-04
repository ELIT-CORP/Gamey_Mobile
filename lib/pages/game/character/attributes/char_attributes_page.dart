import 'package:flutter/material.dart';
import 'package:gamey_flutter/pages/game/character/widgets/attributesRow_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

var hardSkills = ['axe', 'crossbow', 'dagger', 'shield', 'staff', 'sword'];
var softSkills = ['armor', 'backpack', 'gauntlet', 'neckless', 'pants', 'potion'];

class CharAttributes extends StatefulWidget {
  const CharAttributes({Key? key}) : super(key: key);

  @override
  State<CharAttributes> createState() => _CharAttributesState();
}

class _CharAttributesState extends State<CharAttributes> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/png/char_bg.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(26.0),
                child: Text(
                  "Choose your hard skill",
                  style: GoogleFonts.oswald(
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      color: Colors.white),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Expanded(flex:1,child: AttributesRow(type: 'hardSkills',items: hardSkills)),
            Image.asset('assets/images/png/characters/dino_${Get.arguments['index']}.png'),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(26.0),
                child: Text(
                  "Choose your soft skill",
                  style: GoogleFonts.oswald(
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      color: Colors.white),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Expanded(flex:1,child: AttributesRow(type: 'softSkills',items: softSkills)),
            Container(
              width: 300,
              height: 60,
              margin: EdgeInsets.all(26),
              decoration: BoxDecoration(
                color: Color(0xFF98CE00),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3)),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Get.offNamed("/webview");
                },
                child: Center(
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.oswald(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
