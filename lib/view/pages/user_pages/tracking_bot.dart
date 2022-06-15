// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/size_config.dart';
import 'package:shadid/utils/styles.dart';
import 'package:shadid/view/pages/user_pages/tracking_after_pay.dart';

class TrackingBot extends StatefulWidget {
  String orderId;
  TrackingBot({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  State<TrackingBot> createState() => _TrackingBotState();
}

class _TrackingBotState extends State<TrackingBot> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 80,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CircleAvatar(
                  backgroundColor: colorLightGrey2,
                  maxRadius: 30.0,
                  child: SizedBox(
                      width: 35,
                      height: 35,
                      child:
                          SvgPicture.asset('assets/img/clients_help_icon.svg')),
                ),
              ),
            ],
            centerTitle: true,
            title: Text(
              '${AppLocalization.of(context)?.getTranslatedValue('delivered')}',
              style: blackText18,
            ),
            leading: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 30,
                  width: 50,
                  child: SvgPicture.asset('assets/img/arrow_back.svg'),
                )),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      widget.orderId,
                      style: greyText16,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: Colors.white,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomScrollView(
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  slivers: [
                    // SliverAppBar(
                    //   automaticallyImplyLeading: false,
                    //   expandedHeight: 90,
                    //   backgroundColor: colorBackground,
                    //   flexibleSpace: FlexibleSpaceBar(
                    //     background: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         IntrinsicHeight(
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.stretch,
                    //             children: [
                    //               Expanded(
                    //                 flex: 1,
                    //                 child: Align(
                    //                   alignment: AlignmentDirectional.centerStart,
                    //                   child: GestureDetector(
                    //                       onTap: () {},
                    //                       child: Icon(
                    //                         Icons.arrow_back,
                    //                         size: 30,
                    //                         color: colorIconGrey,
                    //                       )),
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                   flex: 1,
                    //                   child: GestureDetector(
                    //                     onTap: () {},
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.symmetric(
                    //                           vertical: 8.0),
                    //                       child: Padding(
                    //                         padding: const EdgeInsets.symmetric(
                    //                             horizontal: 2.5),
                    //                         child: Center(
                    //                           child: Text(
                    //                             '${AppLocalization.of(context)?.getTranslatedValue('orderTracking')}',
                    //                             style: blackText18,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   )),
                    //               Expanded(
                    //                 flex: 1,
                    //                 child: Align(
                    //                   alignment: AlignmentDirectional.centerEnd,
                    //                   child: CircleAvatar(
                    //                     backgroundColor: colorLightGrey2,
                    //                     maxRadius: 30.0,
                    //                     child: SvgPicture.asset(
                    //                         'assets/img/clients_help_icon.svg'),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.only(top: 8.0),
                    //           child: Text(
                    //             'p 03:09',
                    //             style: lightText,
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SliverList(
                        delegate: SliverChildListDelegate(
                            [firstMsg(), secondMsg(10), thirdMsg()]))
                  ]),
            ),
          ),
          bottomNavigationBar: footer()),
    );
  }

  Widget firstMsg() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SizedBox(
              width: SizeConfig.screenH! * 0.35,
              height: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: SizeConfig.screenH! * 0.35,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: colorBackground),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          '${AppLocalization.of(context)?.getTranslatedValue('generateInvoice')}',
                          style: blackText18_400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset('assets/img/msg_seen.svg'),
                        SvgPicture.asset('assets/img/msg_seen.svg'),
                        Text(
                          DateFormat.jm().format(DateTime.now()).toString(),
                          style: greyTextMsgTime,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget secondMsg(int amount) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: SizeConfig.screenH! * 0.35,
            height: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: SizeConfig.screenH! * 0.35,
                  height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorBackground),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: .0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '${AppLocalization.of(context)?.getTranslatedValue('deliveryInvoice')}',
                            style: blackText18_400,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${AppLocalization.of(context)?.getTranslatedValue('deliveryInvoice')}',
                              style: blackText18_400,
                            ),
                            Text(
                              '$amount\$',
                              style: blackText18_400,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            child: Text(
                              '${AppLocalization.of(context)?.getTranslatedValue('payTheAmount')}',
                              style: whiteText18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset('assets/img/msg_seen.svg'),
                      SvgPicture.asset('assets/img/msg_seen.svg'),
                      Text(
                        DateFormat.jm().format(DateTime.now()).toString(),
                        style: greyTextMsgTime,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget thirdMsg() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: SizeConfig.screenH! * 0.35,
              height: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: SizeConfig.screenH! * 0.35,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorBackground,
                      image: const DecorationImage(
                        image: AssetImage("assets/img/background_map.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              '${AppLocalization.of(context)?.getTranslatedValue('orderTracking')}',
                              style: blackText18_400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: SvgPicture.asset(
                                    'assets/img/map_marker.svg')),
                          ),
                          SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    // MaterialPageRoute(
                                    //   builder: (context) => TrackingScreen(),
                                    // ),
                                    PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 400),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return ScaleTransition(
                                          alignment: Alignment.center,
                                          scale: animation,
                                          child: child,
                                        );
                                      },
                                      pageBuilder: ((context, animation,
                                              secondaryAnimation) =>
                                          TrackingScreen()),
                                    ));
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                '${AppLocalization.of(context)?.getTranslatedValue('orderTracking')}',
                                style: whiteText18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset('assets/img/msg_seen.svg'),
                        SvgPicture.asset('assets/img/msg_seen.svg'),
                        Text(
                          DateFormat.jm().format(DateTime.now()).toString(),
                          style: greyTextMsgTime,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget footer() {
    return Container(
      color: Colors.white,
      height: 65,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: colorLightGrey4.withOpacity(0.5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('messageIsDisabled')}',
                        style: greyText14_600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.send,
                      color: colorIconGrey.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(
              Icons.camera_alt_rounded,
              color: colorIconGrey.withOpacity(0.5),
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(
              CupertinoIcons.mic,
              color: colorIconGrey.withOpacity(0.5),
            ),
          )
        ]),
      ),
    );
  }
}
