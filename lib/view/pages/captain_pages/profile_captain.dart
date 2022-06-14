import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shadid/model/cacheHelper.dart';
import 'package:shadid/utils/captain_profile_icons_icons.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/pages/splash.dart';
import 'package:shadid/view/widgets/customButton.dart';

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
        'onTap': null,
      },
      {
        'title': 'إجمالي رسوم التوصيل',
        'icon': CaptainProfileIcons.analyze,
        'trailing': '1510 ر.س',
        'onTap': null,
      },
      {
        'title': 'عدد الطلبات',
        'icon': CaptainProfileIcons.car,
        'trailing': '15 طلبات',
        'onTap': null,
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
          CacheHelper.removeData(key: 'api_token');
          CacheHelper.removeData(key: 'isCaptainRegistered');
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
                  Text(
                    CacheHelper.getData(key: 'fullName').toString(),
                    style: const TextStyle(
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
                        onPressed: profileItems[i]['onTap'],
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
    void Function()? onPressed,
  }) {
    return Column(
      children: [
        MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: ListTile(
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
        ),
        if (index == 0)
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: MaterialButton(
              onPressed: () {
                showModalBottomSheet(
                  enableDrag: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 6.0,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50.0)),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'أضف الرصيد',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              Icon(Icons.close),
                            ],
                          ),
                          const Divider(),
                          const Text(
                            'طريقة السداد',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  CircleAvatar(),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    '5789 ****',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text('تغيير'),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(Icons.arrow_forward),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            'أدخل المبلغ المراد إضافته إلى رصيدك',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '0.00',
                              filled: true,
                              fillColor: Colors.grey[200],
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: CustomButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              title: 'سدد',
                              context: context,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
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
