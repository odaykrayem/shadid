import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/pages/user_pages/offers.dart';
import 'package:shadid/view/widgets/customButton.dart';

class SearchCaptain extends StatefulWidget {
  const SearchCaptain({Key? key}) : super(key: key);

  @override
  State<SearchCaptain> createState() => _SearchCaptainState();
}

class _SearchCaptainState extends State<SearchCaptain> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 6),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return const Offers();
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 75.0,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        title: Text(
          '${AppLocalization.of(context)?.getTranslatedValue('searchForCaptain')}',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: Image.asset('assets/img/clients_help_icon.png'),
            ),
          ),
        ],
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  'assets/img/search_logo.svg',
                  height: 180.0,
                  width: 180.0,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      '${AppLocalization.of(context)?.getTranslatedValue('plzWait')}',
                      textStyle: TextStyle(
                        color: primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      cursor: '.',
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  pause: const Duration(milliseconds: 1000),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${AppLocalization.of(context)?.getTranslatedValue('deliveryWillBegain')}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            CustomButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              title:
                  '${AppLocalization.of(context)?.getTranslatedValue('cancelOrder')}',
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
