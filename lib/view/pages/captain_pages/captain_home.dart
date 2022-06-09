import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/custom_icon_icons.dart';
import 'package:shadid/view/pages/user_pages/notifications.dart';

enum SearchOptions { open, close }

enum CaptainAccountStatus { active, inactive }

class CaptainHome extends StatefulWidget {
  @override
  _CaptainHomeState createState() {
    return _CaptainHomeState();
  }
}

class _CaptainHomeState extends State<CaptainHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  CaptainAccountStatus accountStatus = CaptainAccountStatus.active;
  SearchOptions option = SearchOptions.close;

  // FirebaseAuth? _auth;

  // Future<void> _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   debugPrint(_auth?.currentUser?.phoneNumber);

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${AppLocalization.of(context)?.getTranslatedValue('hello')}',
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Image.asset('assets/img/emoji.png'),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: primaryColor,
                      cursorWidth: 1.0,
                      onTap: () {
                        // foundServices = services;
                        setState(() {
                          option = SearchOptions.open;
                        });
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText:
                            '${AppLocalization.of(context)?.getTranslatedValue('searchYourOrder')}',
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 14.0,
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey[100]!,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey[100]!,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey[100]!,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      highlightElevation: 0.0,
                      color: Colors.grey[100],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Notifications();
                            },
                          ),
                        );
                      },
                      child: Icon(
                        CustomIcon.notification,
                        size: 22.0,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60.0),
              if (accountStatus == CaptainAccountStatus.inactive)
                Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: primaryColor.withOpacity(0.4),
                        maxRadius: 28.0,
                        child: CircleAvatar(
                          backgroundColor: primaryColor,
                          maxRadius: 25.0,
                          child: Image.asset('assets/img/ex_logo.png'),
                        ),
                      ),
                      const Text(
                        'خليك قريب',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'سيتم التواصل معك قريباً في حال تمت\nالموافقة على طلبك و سنستغرق هذه\nالخطوة 25 ساعة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            DottedBorder(
                              color: primaryColor,
                              strokeWidth: 1.0,
                              dashPattern: const [3],
                              borderType: BorderType.Circle,
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                maxRadius: 30.0,
                                backgroundColor: Colors.grey[100],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text('10'),
                            const Text(
                              'مكتمل',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            DottedBorder(
                              color: Colors.red,
                              strokeWidth: 1.0,
                              dashPattern: const [3],
                              borderType: BorderType.Circle,
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                maxRadius: 30.0,
                                backgroundColor: Colors.grey[100],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text('10'),
                            const Text(
                              'مستبعد',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            DottedBorder(
                              color: Colors.orange,
                              strokeWidth: 1.0,
                              dashPattern: const [3],
                              borderType: BorderType.Circle,
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                maxRadius: 30.0,
                                backgroundColor: Colors.grey[100],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text('10'),
                            const Text(
                              'جاري التنفيذ',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            DottedBorder(
                              color: Colors.grey,
                              strokeWidth: 1.0,
                              dashPattern: const [3],
                              borderType: BorderType.Circle,
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                maxRadius: 30.0,
                                backgroundColor: Colors.grey[100],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text('10'),
                            const Text(
                              'بانتظار الموافقة',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('آخر الطلبات المنجزة'),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(primaryColor),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                          ),
                          child: const Text('الكل'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('نقل سريع'),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Ford Focus 2022',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(6.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: const Text(
                                  'تم التوصيل',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Text('توصيل صندوق مستلزمات سباكة للبيت'),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
