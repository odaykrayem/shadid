import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/custom_icon_icons.dart';
import 'package:shadid/view/pages/captain_pages/notifications_captain.dart';
import 'package:shadid/view/pages/user_pages/others.dart';
import 'package:shadid/view/pages/user_pages/quick_trans.dart';
import 'package:shadid/view/pages/user_pages/trucks.dart';

enum CaptainAccountStatus { active, inactive }

enum SearchOptions { open, close }

class CaptainMainPage extends StatefulWidget {
  const CaptainMainPage({Key? key}) : super(key: key);

  @override
  State<CaptainMainPage> createState() => _CaptainMainPageState();
}

class _CaptainMainPageState extends State<CaptainMainPage> {
  CaptainAccountStatus accountStatus = CaptainAccountStatus.active;
  SearchOptions option = SearchOptions.close;
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
      backgroundColor: Colors.white,
      body: option == SearchOptions.close
          ? NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                child: Padding(
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
                                        return NotificationsCaptain();
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
                                  backgroundColor:
                                      primaryColor.withOpacity(0.4),
                                  maxRadius: 28.0,
                                  child: CircleAvatar(
                                    backgroundColor: primaryColor,
                                    maxRadius: 25.0,
                                    child:
                                        Image.asset('assets/img/ex_logo.png'),
                                  ),
                                ),
                                Text(
                                  '${AppLocalization.of(context)?.getTranslatedValue('stayClose')}',
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${AppLocalization.of(context)?.getTranslatedValue('massageBeforAcitve')}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                          child: Image.asset(
                                              'assets/img/captain_icons/completed.png'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      const Text('10'),
                                      Text(
                                        '${AppLocalization.of(context)?.getTranslatedValue('completed')}',
                                        style: const TextStyle(
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
                                          child: Image.asset(
                                              'assets/img/captain_icons/ignored.png'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      const Text('10'),
                                      Text(
                                        '${AppLocalization.of(context)?.getTranslatedValue('excluded')}',
                                        style: const TextStyle(
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
                                          child: Image.asset(
                                              'assets/img/captain_icons/done.png'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      const Text('10'),
                                      Text(
                                        '${AppLocalization.of(context)?.getTranslatedValue('loadingToDone')}',
                                        style: const TextStyle(
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
                                          child: Image.asset(
                                              'assets/img/captain_icons/wait.png'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      const Text('10'),
                                      Text(
                                        '${AppLocalization.of(context)?.getTranslatedValue('waitingToAccess')}',
                                        style: const TextStyle(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${AppLocalization.of(context)?.getTranslatedValue('latestCompOrd')}',
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              primaryColor),
                                      textStyle: MaterialStateProperty.all(
                                        const TextStyle(
                                          fontSize: 12.0,
                                          fontFamily: 'Tajawal',
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      '${AppLocalization.of(context)?.getTranslatedValue('all')}',
                                    ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${AppLocalization.of(context)?.getTranslatedValue('quickTrans')}',
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            const Text(
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
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Text(
                                            '${AppLocalization.of(context)?.getTranslatedValue('deliveryDone')}',
                                            style: const TextStyle(
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
                                    const Text(
                                        'توصيل صندوق مستلزمات سباكة للبيت'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
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
}
