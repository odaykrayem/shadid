import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/custom_icon_icons.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() {
    return _NotificationsState();
  }
}

class _NotificationsState extends State<Notifications> {
  List<Map<String, dynamic>> notifications = [
    {
      'title':
          'طلبك رقم 05850303 يتم تنفيذه الآن نقل بضائع من الرياض إلى مكة المكرمة',
      'subtitle': 'الآن',
      'icon': CustomIcon.list_task,
      'backgroundColor': const Color(0xffF2D8D8),
      'foregroundColor': const Color(0xffb94848),
    },
    {
      'title': 'لقد تم الانتهاء من طلب رقم 068031 يرجى تقييم الخدمة',
      'subtitle': 'منذ 57 دقيقة',
      'icon': CustomIcon.notification,
      'backgroundColor': const Color(0xffCCE8F4),
      'foregroundColor': const Color(0xff57bcf6),
    },
    {
      'title': 'جاري تنفيذ طلبك رقم 5616164 برجاء مراجعة مزود الخدمة',
      'subtitle': 'منذ ساعة واحدة',
      'icon': CustomIcon.box,
      'backgroundColor': const Color(0xffF1F1F1),
      'foregroundColor': const Color(0xff9b9595),
    },
    {
      'title': 'لقد تم الانتهاء من طلب رقم 068031 يرجى تقييم الخدمة',
      'subtitle': 'منذ 5 ساعات',
      'icon': CustomIcon.notification,
      'backgroundColor': const Color(0xffCCE8F4),
      'foregroundColor': const Color(0xff57bcf6),
    },
    {
      'title': 'لقد تم الانتهاء من طلب رقم 068031 يرجى تقييم الخدمة',
      'subtitle': 'السبت الساعة 5:30 م',
      'icon': CustomIcon.box,
      'backgroundColor': const Color(0xffF1F1F1),
      'foregroundColor': const Color(0xff9b9595),
    },
  ];

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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        title: Text(
          '${AppLocalization.of(context)?.getTranslatedValue('notifications')}',
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: 'Tajawal',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.grey[50],
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.grey[200],
          ),
        ),
        child: RefreshIndicator(
          color: primaryColor,
          onRefresh: () async {
            await Future.delayed(
              const Duration(seconds: 3),
              () {},
            );
          },
          child: ListView.separated(
            itemCount: notifications.length,
            separatorBuilder: (context, i) => const Divider(
              indent: 20.0,
              endIndent: 20.0,
            ),
            itemBuilder: (context, i) => NotificationItem(
              title: notifications[i]['title'],
              subtitle: notifications[i]['subtitle'],
              icon: notifications[i]['icon'],
              backgroundColor: notifications[i]['backgroundColor'],
              foregroundColor: notifications[i]['foregroundColor'],
            ),
          ),
        ),
      ),
    );
  }

  Widget NotificationItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color backgroundColor,
    required Color foregroundColor,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14.0,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12.0,
        ),
      ),
      leading: CircleAvatar(
        maxRadius: 25.0,
        backgroundColor: backgroundColor,
        child: Icon(
          icon,
          color: foregroundColor,
        ),
      ),
      trailing: PopupMenuButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        icon: const Icon(
          Icons.more_horiz,
          color: Colors.black,
        ),
        itemBuilder: (context) {
          return <PopupMenuEntry>[
            const PopupMenuItem(
              child: Text('Item 1'),
            ),
            const PopupMenuItem(
              child: Text('Item 2'),
            ),
            const PopupMenuItem(
              child: Text('Item 3'),
            ),
          ];
        },
      ),
    );
  }
}
