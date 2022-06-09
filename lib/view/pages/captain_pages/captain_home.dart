import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/custom_icon_icons.dart';
import 'package:shadid/view/pages/user_pages/notifications.dart';

enum SearchOptions { open, close }

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
          child: ListView(
            clipBehavior: Clip.none,
            children: [
              Column(
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
