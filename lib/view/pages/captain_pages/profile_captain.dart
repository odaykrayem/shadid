import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shadid/utils/captain_profile_icons_icons.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/pages/splash.dart';

class ProfileCaptain extends StatefulWidget {
  const ProfileCaptain({Key? key}) : super(key: key);

  @override
  State<ProfileCaptain> createState() => _ProfileCaptainState();
}

class _ProfileCaptainState extends State<ProfileCaptain> {
  FirebaseAuth? _auth;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    debugPrint(_auth?.currentUser?.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> profileItems = [
      {
        'title': 'رصيد الحساب',
        'icon': const Icon(CaptainProfileIcons.walet),
        'trailing': '150 ر.س',
        'onTap': () {},
      },
      {
        'title': 'إجمالي رسوم التوصيل',
        'icon': const Icon(CaptainProfileIcons.analyze),
        'trailing': '1510 ر.س',
        'onTap': () {},
      },
      {
        'title': 'عدد الطلبات',
        'icon': const Icon(CaptainProfileIcons.car),
        'trailing': '15 طلبات',
        'onTap': () {},
      },
      {
        'title': 'بيانات الدفع',
        'icon': const Icon(CaptainProfileIcons.payment),
        'trailing': '',
        'onTap': () {},
      },
      {
        'title': 'التقييمات',
        'icon': const Icon(CaptainProfileIcons.star),
        'trailing': '',
        'onTap': () {},
      },
      {
        'title': 'مركز المساعدة',
        'icon': const Icon(CaptainProfileIcons.clients_help),
        'trailing': '',
        'onTap': () {},
      },
      {
        'title': 'سياسة الخصوصية',
        'icon': const Icon(CaptainProfileIcons.car),
        'trailing': '',
        'onTap': () {},
      },
      {
        'title': 'إعدادات اللغة',
        'icon': const Icon(CaptainProfileIcons.lang),
        'trailing': '',
        'onTap': () {},
      },
      {
        'title': 'تسجيل الخروج',
        'icon': const Icon(CaptainProfileIcons.logout),
        'trailing': '',
        'onTap': () {
          _signOut().then((value) {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return const Splash();
            }), (route) => false);
          });
        },
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: secondaryColor,
                        maxRadius: 54.0,
                        child: const CircleAvatar(
                          backgroundColor: Colors.amber,
                          maxRadius: 50.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 5.0,
                          right: 5.0,
                        ),
                        child: CircleAvatar(
                          backgroundColor: secondaryColor,
                          maxRadius: 14.0,
                          child: CircleAvatar(
                            maxRadius: 10.0,
                            backgroundColor: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: profileItems.length,
                    separatorBuilder: (context, i) =>
                        const SizedBox(height: 20.0),
                    itemBuilder: (context, i) {
                      return profileItem(
                        title: profileItems[i]['title'],
                        trailing: profileItems[i]['trailing'],
                        icon: profileItems[i]['icon'],
                        index: i,
                        onTap: profileItems[i]['onTap'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget profileItem({
    required String title,
    required String trailing,
    required Icon icon,
    required int index,
    void Function()? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: tripleColor,
        child: icon,
      ),
      trailing: index == 0 || index == 1 || index == 2
          ? Text(trailing)
          : const Icon(Icons.arrow_forward_ios),
    );
  }
}
