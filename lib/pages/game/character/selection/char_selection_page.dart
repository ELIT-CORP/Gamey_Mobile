import 'package:flutter/material.dart';
import 'package:gamey_flutter/resources/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widgets/selection_widget.dart';

PageController? _pageController;

class CharSelection extends StatefulWidget {
  const CharSelection({Key? key}) : super(key: key);

  @override
  State<CharSelection> createState() => _CharSelectionState();
}

class _CharSelectionState extends State<CharSelection> {

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
  }

  final colors = [
    AppColors.char_0,
    AppColors.char_1,
    AppColors.char_2,
    AppColors.char_3
  ];

  var data = 0;

  void _changeIndex(idx) {
    setState(() {
      data = idx;
    });
  }

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
            Padding(
              padding: EdgeInsets.all(26.0),
              child: Text(
                "Choose your character",
                style: GoogleFonts.oswald(
                    fontWeight: FontWeight.w400,
                    fontSize: 40,
                    color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 4,
                pageSnapping: true,
                itemBuilder: (context, index) {
                  return VisibilityDetector(
                    key: Key(index.toString()),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction == 1) {
                        _changeIndex(index);
                      }
                    },
                    child: Selection(
                      index: index,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      color: colors.elementAt(data).withOpacity(0.7),
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
                        Get.toNamed("/attributes", arguments: {'index': data});
                      },
                      child: Center(
                          child: Text(
                        'Selecionar',
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
          ],
        ),
      ),
    );
  }
}
