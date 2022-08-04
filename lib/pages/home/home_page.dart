import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gamey_flutter/pages/home/home_ui_store.dart';
import 'package:gamey_flutter/pages/home/widgets/home_card.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

final homeStore = HomeUIStore();
PageController? _pageController;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.87);
  }

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
            onPressed: () {
              Get.toNamed('/signin');
            }),
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
      body: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        pageSnapping: true,
        itemBuilder: (context, index) {
          return Observer(
            builder: (_) => VisibilityDetector(
                key: Key(index.toString()),
                onVisibilityChanged: (VisibilityInfo info) {
                  if (info.visibleFraction == 1) {
                    homeStore.increment(index);
                  }
                },
                child: HomeCard(
                  index: index,
                  color: index != homeStore.value
                      ? Colors.black
                      : Colors.transparent,
                )),
          );
        },
      ),
    );
  }
}
