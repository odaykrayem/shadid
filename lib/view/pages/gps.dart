import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/model/cacheHelper.dart';
import 'package:shadid/view/auth/auth_captain/captain_register.dart';
import 'package:shadid/view/auth/register.dart';
import 'package:shadid/view/pages/user_pages/user_home.dart';
import 'package:shadid/view/widgets/customButton.dart';

class GPS extends StatefulWidget {
  @override
  _GPSState createState() {
    return _GPSState();
  }
}

class _GPSState extends State<GPS> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
              children: [
                Text(
                  '${AppLocalization.of(context)?.getTranslatedValue('selectLocation')}',
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 50.0),
                Image.asset('assets/img/map.png'),
                const SizedBox(height: 30.0),
                Text(
                  '${AppLocalization.of(context)?.getTranslatedValue('selectLocation')}',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  '${AppLocalization.of(context)?.getTranslatedValue('plzSelectLocation')}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const Spacer(),
                CustomButton(
                  onPressed: () {
                    Permission.locationWhenInUse.request().then((value) => {
                          if (value.isGranted)
                            {
                              if (CacheHelper.getData(key: 'type') ==
                                  "${UserType.user}")
                                {
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(builder: (context) {
                                    return UserHome();
                                  }), (route) => false),
                                }
                              else
                                {
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CaptainRegister();
                                  }), (route) => false),
                                }
                            }
                        });
                  },
                  title:
                      '${AppLocalization.of(context)?.getTranslatedValue('allowLocation')}',
                  context: context,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 55.0,
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    onPressed: () {
                      if (CacheHelper.getData(key: 'type') ==
                          "${UserType.user}") {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return UserHome();
                        }), (route) => false);
                      }
                      if (CacheHelper.getData(key: 'type') ==
                          "${UserType.captain}") {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return CaptainRegister();
                        }), (route) => false);
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      '${AppLocalization.of(context)?.getTranslatedValue('disallow')}',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
