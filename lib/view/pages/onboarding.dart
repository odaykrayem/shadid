// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/size_config.dart';
import 'package:shadid/view/auth/register.dart';
import 'package:shadid/view/widgets/customButton.dart';

class OnboardingContents {
  final String title;
  final String image;

  OnboardingContents({required this.title, required this.image});
}

class OnboardingScreen extends StatefulWidget {
  static BuildContext? context;
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: _currentPage == index ? primaryColor : Colors.grey,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<OnboardingContents> contents = [
      OnboardingContents(
        title:
            '${AppLocalization.of(context)?.getTranslatedValue('onBoard_first')}',
        image: "assets/img/first.png",
      ),
      OnboardingContents(
        title:
            '${AppLocalization.of(context)?.getTranslatedValue('onBoard_second')}',
        image: "assets/img/second.png",
      ),
      OnboardingContents(
        title:
            '${AppLocalization.of(context)?.getTranslatedValue('onBoard_third')}',
        image: "assets/img/third.png",
      ),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) => setState(() => _currentPage = value),
                  itemCount: contents.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            contents[i].image,
                            // height: SizeConfig.blockV! * 35,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              contents[i].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  // fontSize: 22.0,
                                  fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (int index) => _buildDots(index: index),
                      ),
                    ),
                    _currentPage + 1 == contents.length
                        ? Padding(
                            padding: const EdgeInsets.only(
                                bottom: 120.0, right: 20.0, left: 20.0),
                            child: CustomButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Register();
                                }), (route) => false);
                              },
                              title: '${AppLocalization.of(context)?.getTranslatedValue('startNow')}',
                              context: context,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                bottom: 120.0, right: 20.0, left: 20.0),
                            child: CustomButton(
                              onPressed: () {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                );
                              },
                              title:'${AppLocalization.of(context)?.getTranslatedValue('next')}',
                              context: context,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
