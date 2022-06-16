import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/model/blocObserver.dart';
import 'package:shadid/model/cacheHelper.dart';
import 'package:shadid/model/dioHelper.dart';
import 'package:shadid/view/auth/register.dart';
import 'package:shadid/view/pages/captain_pages/captain_home.dart';
import 'package:shadid/view/pages/user_pages/user_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await Firebase.initializeApp();
  await CacheHelper.init();

  // CacheHelper.removeData(key: 'isCaptainRegistered');
  debugPrint(CacheHelper.getData(key: 'api_token').toString());
  debugPrint(CacheHelper.getData(key: 'isNew').toString());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor:
          CacheHelper.getData(key: 'type') == "${UserType.user}"
              ? Colors.grey[100]
              : Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Locale? _locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Tajawal',
      ),

      home: CaptainHome(),

      locale: _locale,
      supportedLocales: [
        const Locale('ar', 'SA'),
        const Locale('en', 'US'),
        Locale(
          "${CacheHelper.getData(key: 'languageCode')}",
          "${CacheHelper.getData(key: 'countryCode')}",
        ),
      ],
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (CacheHelper.getData(key: 'languageCode') == null) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale?.languageCode &&
                locale.countryCode == deviceLocale?.countryCode) {
              return deviceLocale;
            }
          }
        } else {
          return supportedLocales.elementAt(2);
        }

        return supportedLocales.elementAt(0);
      },
    );
  }
}
