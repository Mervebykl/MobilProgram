import 'package:burclar/BurcListesi.dart';
import 'package:burclar/anasayfa.dart';
import 'package:burclar/burcozellik.dart';
import 'package:burclar/main.dart';
import 'package:burclar/yorumlar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'burclisttt.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  var _currentIndex = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void onPageChanged(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
    });
  }

  void navigationTapped(int currentIndex) {
    pageController.jumpToPage(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .130,
        decoration: BoxDecoration(
          color: Colors.pink,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .3),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              _currentIndex = index;
              HapticFeedback.lightImpact();
              navigationTapped(_currentIndex);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == _currentIndex
                      ? displayWidth * .20
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    //navigator bar seçili durumunun boyut ayarı
                    height: index == _currentIndex ? displayWidth * .11 : 0,
                    width: index == _currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == _currentIndex
                          ? Colors.pink.shade50
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == _currentIndex
                      ? displayWidth * .15
                      : displayWidth * .15,
                  alignment: Alignment.center,
                  child: Container(
                    width: displayWidth,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == _currentIndex
                                    ? displayWidth * .13
                                    : 0,
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: index == _currentIndex ? 1 : 0,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  index == _currentIndex
                                      ? '${listOfStrings[index]}'
                                      : '',
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == _currentIndex
                                  ? displayWidth * .05
                                  : 10,
                            ),
                            Icon(
                              listOfIcons[index],
                              size: displayWidth * .05,
                              color: index == _currentIndex
                                  ? Colors.pink
                                  : Colors.black26,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_outlined,
    Icons.diamond,
  ];

  List<String> listOfStrings = [
    'Home',
    'List',
  ];
  List<Widget> pages = [
    const home(),
    BurcListesi(),
  ];
}
