import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gamey_flutter/pages/home/home_ui_store.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../resources/colors.dart';

class Selection extends StatelessWidget {
  final int index;

  const Selection({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Image.asset(
        'assets/images/png/characters/profile/char-profile_$index.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
