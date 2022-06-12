// ignore_for_file: iterable_contains_unrelated_type

import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';

class MassagesCaptain extends StatefulWidget {
  const MassagesCaptain({Key? key}) : super(key: key);

  @override
  State<MassagesCaptain> createState() => _MassagesCaptainState();
}

class _MassagesCaptainState extends State<MassagesCaptain> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> latestMassages = [
      {
        'title': 'نقل عفش',
        'massage': 'تم الانتهاء من الخدمة يا فندم...',
        'time':
            '5 ${AppLocalization.of(context)?.getTranslatedValue('minute')}',
        'avatar': Colors.red,
      },
      {
        'title': 'نقل بضائع',
        'massage': 'تم الانتهاء من الخدمة يا فندم...',
        'time':
            '30 ${AppLocalization.of(context)?.getTranslatedValue('minute')}',
        'avatar': Colors.blue,
      },
      {
        'title': 'نقل سريع',
        'massage': 'خدمات النقل السريع متاحة على...',
        'time': '1 ${AppLocalization.of(context)?.getTranslatedValue('hour')}',
        'avatar': primaryColor,
      },
      {
        'title': 'نقل أثاث',
        'massage': 'سعداء بالعمل معك يا استاذ...',
        'time': '2 ${AppLocalization.of(context)?.getTranslatedValue('day')}',
        'avatar': Colors.orange,
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'Tajawal',
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        title: Text(
          '${AppLocalization.of(context)?.getTranslatedValue('massages')}',
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent,
                        
                        ),
                    child: ExpansionTile(
                      collapsedIconColor: primaryColor,
                      iconColor: primaryColor,
                      title: Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('latestMassages')}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: latestMassages.length,
                          itemBuilder: (context, i) {
                            return massageItem(
                              index: i,
                              color: i == 0
                                  ? primaryColor.withOpacity(0.1)
                                  : Colors.white,
                              title: latestMassages[i]['title'],
                              massage: latestMassages[i]['massage'],
                              time: latestMassages[i]['time'],
                              avatar: latestMassages[i]['avatar'],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      collapsedIconColor: primaryColor,
                      iconColor: primaryColor,
                      title: Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('previousMassages')}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: latestMassages.length,
                          itemBuilder: (context, i) {
                            if (latestMassages[i]['time'] ==
                                    '2 ${AppLocalization.of(context)?.getTranslatedValue('day')}' ||
                                latestMassages[i]['time'] ==
                                    '1 ${AppLocalization.of(context)?.getTranslatedValue('hour')}') {
                              return massageItem(
                                index: i,
                                title: latestMassages[i]['title'],
                                massage: latestMassages[i]['massage'],
                                time: latestMassages[i]['time'],
                                avatar: latestMassages[i]['avatar'],
                              );
                            }

                            return const SizedBox();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget massageItem({
    required String title,
    required String massage,
    required String time,
    required Color avatar,
    required int index,
    Color? color,
  }) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(massage),
            leading: CircleAvatar(
              backgroundColor: avatar,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                ),
                if (index == 0)
                  CircleAvatar(
                    maxRadius: 10.0,
                    backgroundColor: primaryColor,
                    child: const Text(
                      '2',
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 1.6,
                        color: Colors.white,
                      ),
                    ),
                  )
                else
                  const SizedBox(
                    height: 20.0,
                  ),
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
 