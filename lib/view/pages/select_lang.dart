import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/main.dart';
import 'package:shadid/model/cacheHelper.dart';
import 'package:shadid/view/pages/onboarding.dart';

enum Language { ar, en, nothing }

class SelectLang extends StatefulWidget {
  @override
  State<SelectLang> createState() => _SelectLangState();
}

class _SelectLangState extends State<SelectLang> {
  Language lang = Language.nothing;
  String? languageCode;
  String? countryCode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/img/lang_icon.svg'),
              Container(
                alignment: Alignment.center,
                height: 300.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppLocalization.of(context)?.getTranslatedValue('chooseLangApp')}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 60.0,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: lang == Language.en
                            ? Colors.grey[200]
                            : Colors.grey[50],
                        border: Border.all(
                          color: Colors.grey[400]!,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.ltr,
                        children: [
                          Radio<Language>(
                            activeColor: CupertinoColors.activeGreen,
                            value: Language.en,
                            groupValue: lang,
                            onChanged: (value) {
                              setState(() {
                                lang = value!;
                              });
    
                              MyApp.setLocale(context, const Locale('en', 'US'));
                              languageCode = 'en';
                              countryCode = 'US';
                              CacheHelper.saveData(
                                  key: 'languageCode', value: languageCode);
                              CacheHelper.saveData(
                                  key: 'countryCode', value: countryCode);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OnboardingScreen(),
                                ),
                              );
                            },
                          ),
                          Text(
                            '${AppLocalization.of(context)?.getTranslatedValue('english')}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 60.0,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: lang == Language.ar
                            ? Colors.grey[200]
                            : Colors.grey[50],
                        border: Border.all(
                          color: Colors.grey[400]!,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.ltr,
                        children: [
                          Radio<Language>(
                            activeColor: CupertinoColors.activeGreen,
                            value: Language.ar,
                            groupValue: lang,
                            onChanged: (value) {
                              setState(() {
                                lang = value!;
                              });
                              MyApp.setLocale(context, const Locale('ar', 'SA'));
    
                              languageCode = 'ar';
                              countryCode = 'SA';
                              CacheHelper.saveData(
                                  key: 'languageCode', value: languageCode);
                              CacheHelper.saveData(
                                  key: 'countryCode', value: countryCode);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OnboardingScreen(),
                                ),
                              );
                            },
                          ),
                          Text(
                            '${AppLocalization.of(context)?.getTranslatedValue('arabic')}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${AppLocalization.of(context)?.getTranslatedValue('changeLangSettings')}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
