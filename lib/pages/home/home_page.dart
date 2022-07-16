import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gamey_flutter/pages/home/home_ui_store.dart';
import 'package:gamey_flutter/pages/home/widgets/home_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

final homeStore = HomeUIStore();

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: const Icon(
              Icons.exit_to_app_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {}),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/png/logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Observer(
              builder: (_) => VisibilityDetector(
                key: Key(index.toString()),
                onVisibilityChanged: (VisibilityInfo info) {
                  if (info.visibleFraction == 1) {
                    homeStore.increment(index);
                  }
                },
                child: HomeCard(index: index, color: index != homeStore.value ? Colors.black : Colors.transparent,)
              ),
            );
          },
        ),
      ),
    );
  }
}
