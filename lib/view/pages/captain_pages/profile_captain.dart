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
        'icon': CaptainProfileIcons.walet,
        'trailing': '150 ر.س',
        'onTap': () {},
      },
      {
        'title': 'إجمالي رسوم التوصيل',
        'icon': CaptainProfileIcons.analyze,
        'trailing': '1510 ر.س',
        'onTap': () {},
      },
      {
        'title': 'عدد الطلبات',
        'icon': CaptainProfileIcons.car,
        'trailing': '15 طلبات',
        'onTap': () {},
      },
      {
        'title': 'بيانات الدفع',
        'icon': CaptainProfileIcons.payment,
        'trailing': '',
        'onTap': () {},
      },
      {
        'title': 'التقييمات',
        'icon': CaptainProfileIcons.star,
        'trailing': '',
        'onTap': () {},
      },
      {
        'title': 'مركز المساعدة',
        'icon': CaptainProfileIcons.clients_help,
        'trailing': '',
        'onTap': () {},
      },
      {
        'title': 'سياسة الخصوصية',
        'icon': Icons.abc,
        'trailing': '',
        'onTap': () {},
      },
      {
        'title': 'إعدادات اللغة',
        'icon': CaptainProfileIcons.lang,
        'trailing': '',
        'onTap': () {},
      },
      {
        'title': 'تسجيل الخروج',
        'icon': CaptainProfileIcons.logout,
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'جهاد السماك',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
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
    required IconData icon,
    required int index,
    void Function()? onTap,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: tripleColor,
            child: index == 6
                ? Image.asset(
                    'assets/img/ex_logo.png',
                    height: 25.0,
                    width: 25.0,
                  )
                : Padding(
                    padding: index == 2
                        ? const EdgeInsets.only(right: 6.0)
                        : EdgeInsets.zero,
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
          ),
          trailing: index == 0 || index == 1 || index == 2
              ? Text(
                  trailing,
                  style: TextStyle(
                    color: primaryColor,
                  ),
                )
              : const Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
        ),
        if (index == 0)
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.grey[100],
              elevation: 0.0,
              focusElevation: 0.0,
              hoverElevation: 0.0,
              highlightElevation: 0.0,
              textColor: primaryColor,
              child: const Text('إضافة رصيد'),
            ),
          ),
      ],
    );
  }
}
