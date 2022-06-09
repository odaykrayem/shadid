// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, null_check_always_fails, list_remove_unrelated_type, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/custom_icon_icons.dart';
import 'package:shadid/view/pages/user_pages/notifications.dart';
import 'package:shadid/view/pages/user_pages/others.dart';
import 'package:shadid/view/pages/user_pages/quick_trans.dart';
import 'package:shadid/view/pages/user_pages/trucks.dart';

enum SearchOptions { open, close }

class UserMainPage extends StatefulWidget {
  @override
  _UserMainPageState createState() {
    return _UserMainPageState();
  }
}

class _UserMainPageState extends State<UserMainPage> {
  List searchingHistory = [];
  List<Map<String, dynamic>> _services = [];
  List<Map<String, dynamic>> foundServices = [];
  var searchCon = TextEditingController();
  void runFilter(String keyword) {
    List<Map<String, dynamic>> results = [];
    if (keyword.isEmpty) {
      results = _services;
    } else {
      results = _services.where((service) {
        return service['title'].toLowerCase().contains(keyword.toLowerCase());
      }).toList();
    }
    setState(() {
      foundServices = results;
    });
  }

  SearchOptions option = SearchOptions.close;

  @override
  Widget build(BuildContext context) {
    double widthNavBar = MediaQuery.of(context).size.width;
    double heightNavBar = MediaQuery.of(context).size.height;

    List<Map<String, dynamic>> services = [
      {
        'title':
            '${AppLocalization.of(context)?.getTranslatedValue('quickTrans')}',
        'firstImg': 'assets/img/car1.png',
        'secondImg': 'assets/img/car2.png',
        'thirdImg': 'assets/img/car3.png',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuickTrans(),
            ),
          );
        },
      },
      {
        'title': '${AppLocalization.of(context)?.getTranslatedValue('trucks')}',
        'firstImg': 'assets/img/car4.png',
        'secondImg': 'assets/img/car5.png',
        'thirdImg': 'assets/img/car6.png',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Trucks(),
            ),
          );
        },
      },
      {
        'title': '${AppLocalization.of(context)?.getTranslatedValue('other')}',
        'firstImg': 'assets/img/car7.png',
        'secondImg': 'assets/img/car8.png',
        'thirdImg': 'assets/img/car9.png',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Others(),
            ),
          );
        },
      },
    ];
    _services = services;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: option == SearchOptions.close
          ? Padding(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text(
                          '${AppLocalization.of(context)?.getTranslatedValue('deliveryEasy')}',
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                cursorColor: primaryColor,
                                cursorWidth: 1.0,
                                onTap: () {
                                  foundServices = services;
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
                        const SizedBox(height: 20.0),
                        Text(
                          '${AppLocalization.of(context)?.getTranslatedValue('ourServices')}',
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (notification) {
                            notification.disallowIndicator();
                            return true;
                          },
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: services.length,
                            separatorBuilder: (context, i) => const SizedBox(
                              height: 20.0,
                            ),
                            itemBuilder: (context, i) {
                              return serviceItem(
                                title: services[i]['title'],
                                firstImg: services[i]['firstImg'],
                                secondImg: services[i]['secondImg'],
                                thirdImg: services[i]['thirdImg'],
                                onTap: services[i]['onTap'],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.0,
                      child: TextFormField(
                        onChanged: (value) {
                          runFilter(value);
                        },
                        onFieldSubmitted: (vlaue) {
                          if (searchCon.text.isNotEmpty) {
                            setState(() {
                              searchingHistory.add(searchCon.text);
                            });
                          }
                        },
                        controller: searchCon,
                        cursorColor: primaryColor,
                        cursorWidth: 1.0,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          hintText:
                              '${AppLocalization.of(context)?.getTranslatedValue('searchYourOrder')}',
                          suffixIcon: IconButton(
                            color: Colors.grey,
                            onPressed: () {
                              setState(() {
                                searchCon.clear();
                              });
                            },
                            icon: const Icon(Icons.close),
                          ),
                          icon: IconButton(
                            onPressed: () {
                              searchCon.clear();
                              setState(() {
                                option = SearchOptions.close;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                            ),
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
                    const Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${AppLocalization.of(context)?.getTranslatedValue('searchLog')}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      searchingHistory.clear();
                                    });
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                            searchingHistory.isEmpty
                                ? Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${AppLocalization.of(context)?.getTranslatedValue('emptyLog')}',
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: searchingHistory.length,
                                    itemBuilder: (context, i) => Text(
                                          '${searchingHistory[i]}',
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        )),
                            const Divider(
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              '${AppLocalization.of(context)?.getTranslatedValue('recomendedServices')}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: searchCon.text.isEmpty
                                  ? services.length
                                  : foundServices.length,
                              separatorBuilder: (context, i) =>
                                  const SizedBox(height: 20.0),
                              itemBuilder: (context, i) {
                                return Text(
                                  searchCon.text.isEmpty
                                      ? '${services[i]['title']}'
                                      : '${foundServices[i]['title']}',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget serviceItem({
    required String title,
    required String firstImg,
    required String secondImg,
    required String thirdImg,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(firstImg),
                Image.asset(secondImg),
                Image.asset(thirdImg),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
