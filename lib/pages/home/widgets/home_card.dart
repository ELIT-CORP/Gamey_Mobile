import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gamey_flutter/pages/home/home_ui_store.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatelessWidget {
  final int index;
  var color;

  HomeCard({Key? key, required this.index, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titles = ["Product", "Contact", "Service"];
    final subtitles = [
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
      "Quo neque error repudiandae fuga? ",
      "Veritatis obcaecati enetur iure eius earum ut olestias architecto voluptate liquamnihil, eveniet aliquid culpa officia aut!"
    ];
    final buttons = ["Play", "Call Us", "See Documentation"];

    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/png/section${index}_home.png',
            fit: BoxFit.fitWidth,
            color: color,
            colorBlendMode: BlendMode.color,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Text(
                    titles.elementAt(index),
                    textAlign: TextAlign.start,
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w600,
                        fontSize: 50,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 36.0),
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      subtitles.elementAt(index),
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(239, 251, 14, 1),
                      elevation: 5,
                      fixedSize: const Size.fromWidth(230),
                      padding: const EdgeInsets.all(16),
                      shadowColor: const Color.fromRGBO(2, 2, 2, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      buttons.elementAt(index),
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: const Color.fromRGBO(2, 2, 2, 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
