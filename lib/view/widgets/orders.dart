// import 'dart:convert';

// import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:now/custom_icon2_icons.dart';
// import 'package:now/custom_icon_icons.dart';
// import 'package:now/model/ProductDataModel.dart';
// import 'package:now/model/cacheHelper.dart';
// import 'package:now/pages/prototypeItem.dart';
// import 'package:simple_star_rating/simple_star_rating.dart';
// import 'package:flutter/services.dart' as rootBundle;

// class Orders extends StatefulWidget {
//   @override
//   _OrdersState createState() {
//     return _OrdersState();
//   }
// }

// bool? payOnline;
// bool? payCash;
// enum isDataFounded { yes, no, nothing }

// class _OrdersState extends State<Orders> {
//   Future<List<OrdersInfo>> ReadJsonData() async {
//     final jsondata =
//         await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
//     final list = json.decode(jsondata) as List<dynamic>;

//     return list.map((e) => OrdersInfo.fromJson(e)).toList();
//   }

//   double rate = 4.3;
//   double? rateText;
//   bool isSwitch = true;

//   @override
//   void initState() {
//     super.initState();
//     rateText = rate;
//     choice = isDataFounded.no;
//   }

//   Future<void> getData() async {
//     await Future.delayed(Duration(seconds: 5));
//     setState(() {});
//   }

//   // bool? isDataFounded;
//   isDataFounded choice = isDataFounded.yes;

//   // List<Map> ordersInfo = [
//   //
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener<OverscrollIndicatorNotification>(
//       onNotification: (overscroll) {
//         overscroll.disallowIndicator();
//         return true;
//       },
//       child: Column(
//         children: [
//           Container(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
//             child: Column(
//               children: [
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'الاعدادات',
//                     style: TextStyle(
//                       color: Colors.deepOrange[800],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 50.0,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(50.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey[200]!,
//                         blurRadius: 5.0,
//                         spreadRadius: 2.0,
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.deepOrange[900]!,
//                           ),
//                           borderRadius: BorderRadius.circular(50.0),
//                         ),
//                         child: const CircleAvatar(
//                           backgroundImage:
//                               AssetImage('assets/img/profile(1).png'),
//                           minRadius: 24.0,
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'احمد',
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 '$rateText',
//                                 style: const TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 13.0,
//                                 ),
//                               ),
//                               SimpleStarRating(
//                                 allowHalfRating: true,
//                                 starCount: 5,
//                                 rating: rate,
//                                 size: 15.0,
//                                 isReadOnly: true,
//                                 onRated: (rate) {
//                                   setState(() {
//                                     rateText = rate;
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Switch(
//                         value: isSwitch,
//                         onChanged: (value) {
//                           setState(() {
//                             isSwitch = value;
//                           });
//                         },
//                         activeColor: Colors.white,
//                         activeTrackColor: Colors.deepOrange[900],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (choice == isDataFounded.yes)
//             Expanded(
//               child: RefreshIndicator(
//                 color: Colors.deepOrange[900],
//                 onRefresh: () => getData(),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: FutureBuilder<Object>(
//                       future: ReadJsonData(),
//                       builder: (context, data) {
//                         if (data.hasError) {
//                           return Center(child: Text("${data.error}"));
//                         } else if (data.hasData) {
//                           var items = data.data as List<OrdersInfo>;
//                           return ListView.separated(
//                             shrinkWrap: true,
//                             physics: const AlwaysScrollableScrollPhysics(),
//                             itemBuilder: (context, i) => orderBuilder(
//                               onTap: () {},
//                               companyName: items[i].companyName,
//                               logo: items[i].logo,
//                               order: items[i].order,
//                               time: items[i].time,
//                               valuePay: items[i].valuePay,
//                               payCash: items[i].payCash,
//                               payOnline: items[i].payOnline,
//                             ),
//                             separatorBuilder: (context, i) =>
//                                 const SizedBox(height: 20.0),
//                             itemCount: items.length,
//                           );
//                         } else {
//                           return Center(
//                             child: CircularProgressIndicator(
//                               color: Colors.deepOrange[900],
//                             ),
//                           );
//                         }
//                       }),
//                 ),
//               ),
//             ),
//           if (choice == isDataFounded.no)
//             Expanded(
//               child: RefreshIndicator(
//                 color: Colors.deepOrange[900],
//                 onRefresh: () async {
//                   setState(() {
//                     choice = isDataFounded.yes;
//                   });
//                 },
//                 child: ListView(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const SizedBox(
//                           height: 300.0,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.search,
//                               color: Colors.deepOrange[900],
//                               size: 30.0,
//                             ),
//                             Text(
//                               'اسحب الشاشة للأسفل لتصلك الطلبات',
//                               style: TextStyle(
//                                 color: Colors.deepOrange[800],
//                                 fontSize: 25.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         Icon(
//                           Icons.swipe_down_outlined,
//                           size: 40.0,
//                           color: Colors.deepOrange[900],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget orderBuilder({
//     required String companyName,
//     bool? payOnline,
//     bool? payCash,
//     required String time,
//     required String order,
//     required String logo,
//     required String valuePay,
//     required void Function()? onTap,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => PrototypeItem(
//               companyName: companyName,
//               logo: logo,
//               order: order,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//         height: 100.0,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey[200]!,
//               blurRadius: 3.0,
//               spreadRadius: 2.0,
//               offset: Offset(0.0, 2.5),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           SvgPicture.asset(
//                             'assets/img/history.svg',
//                             color: Colors.deepOrange[900],
//                           ),
//                           Text(
//                             time,
//                             textDirection: TextDirection.rtl,
//                             style: TextStyle(
//                               color: Colors.deepOrange[800],
//                               fontSize: 12.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         width: 15.0,
//                       ),
//                       if (payOnline == true)
//                         Container(
//                           alignment: Alignment.center,
//                           height: 20.0,
//                           width: 50.0,
//                           decoration: BoxDecoration(
//                             color: Colors.deepOrange[100],
//                             borderRadius: BorderRadius.circular(5.0),
//                             border: Border.all(
//                               color: Colors.deepOrange[900]!,
//                               width: 1.0,
//                             ),
//                           ),
//                           child: Text(
//                             'دفع اونلاين',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 10.0,
//                             ),
//                           ),
//                         )
//                       else
//                         Container(
//                           alignment: Alignment.center,
//                           height: 20.0,
//                           width: 50.0,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(5.0),
//                             border: Border.all(
//                               color: Colors.grey[400]!,
//                               width: 1.0,
//                             ),
//                           ),
//                           child: Text(
//                             'دفع اونلاين',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.grey[500],
//                               fontSize: 11.0,
//                             ),
//                           ),
//                         ),
//                       const SizedBox(
//                         width: 10.0,
//                       ),
//                       if (payCash == false)
//                         Container(
//                           alignment: Alignment.center,
//                           height: 20.0,
//                           width: 50.0,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(5.0),
//                             border: Border.all(
//                               color: Colors.grey[400]!,
//                               width: 1.0,
//                             ),
//                           ),
//                           child: Text(
//                             'دفع كاش',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.grey[500],
//                               fontSize: 11.0,
//                             ),
//                           ),
//                         )
//                       else
//                         Container(
//                           alignment: Alignment.center,
//                           height: 20.0,
//                           width: 50.0,
//                           decoration: BoxDecoration(
//                             color: Colors.deepOrange[100],
//                             borderRadius: BorderRadius.circular(5.0),
//                             border: Border.all(
//                               color: Colors.deepOrange[900]!,
//                               width: 1.0,
//                             ),
//                           ),
//                           child: Text(
//                             'دفع كاش',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 10.0,
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   child: Row(
//                     children: [
//                       Text(
//                         companyName,
//                         style: const TextStyle(
//                           fontSize: 17.0,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 15.0,
//                       ),
//                       CircleAvatar(
//                         backgroundImage: AssetImage('assets/img/$logo'),
//                         maxRadius: 16.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 45.0),
//               child: Container(
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   order == "noValue" ? valuePay : order,
//                   textDirection: TextDirection.rtl,
//                   style: TextStyle(
//                     color: Colors.grey[500],
//                     fontSize: 12.0,
//                   ),
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     SvgPicture.asset(
//                       'assets/img/location.svg',
//                       color: Colors.deepOrange[900],
//                     ),
//                     Text(
//                       'تسليم',
//                       textDirection: TextDirection.rtl,
//                       style: TextStyle(
//                         color: Colors.deepOrange[800],
//                         fontSize: 10.0,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.deepOrange[900],
//                       maxRadius: 2.5,
//                     ),
//                     const SizedBox(
//                       width: 5.0,
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.deepOrange[900],
//                       maxRadius: 2.5,
//                     ),
//                     const SizedBox(
//                       width: 5.0,
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.deepOrange[900],
//                       maxRadius: 2.5,
//                     ),
//                   ],
//                 ),
//                 Container(
//                   height: 35.0,
//                   width: 75.0,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5.0),
//                     border: Border.all(
//                       color: Colors.deepOrange[900]!,
//                       width: 1.0,
//                     ),
//                   ),
//                   child: Text(
//                     '2 كم',
//                     textAlign: TextAlign.center,
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(
//                       color: Colors.deepOrange[800],
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.deepOrange[900],
//                       maxRadius: 2.5,
//                     ),
//                     const SizedBox(
//                       width: 5.0,
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.deepOrange[900],
//                       maxRadius: 2.5,
//                     ),
//                     const SizedBox(
//                       width: 5.0,
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.deepOrange[900],
//                       maxRadius: 2.5,
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     SvgPicture.asset(
//                       'assets/img/box.svg',
//                       color: Colors.deepOrange[900],
//                     ),
//                     Text(
//                       'استلام',
//                       textDirection: TextDirection.rtl,
//                       style: TextStyle(
//                         color: Colors.deepOrange[800],
//                         fontSize: 10.0,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.deepOrange[900],
//                       maxRadius: 2.5,
//                     ),
//                     const SizedBox(
//                       width: 5.0,
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.deepOrange[900],
//                       maxRadius: 2.5,
//                     ),
//                     const SizedBox(
//                       width: 5.0,
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.deepOrange[900],
//                       maxRadius: 2.5,
//                     ),
//                   ],
//                 ),
//                 Container(
//                   height: 35.0,
//                   width: 75.0,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5.0),
//                     border: Border.all(
//                       color: Colors.deepOrange[900]!,
//                       width: 1.0,
//                     ),
//                   ),
//                   child: Text(
//                     '2 كم',
//                     textAlign: TextAlign.center,
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(
//                       color: Colors.deepOrange[800],
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.deepOrange[900],
//                       maxRadius: 2.5,
//                     ),
//                     const SizedBox(
//                       width: 5.0,
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.deepOrange[900],
//                       maxRadius: 2.5,
//                     ),
//                     const SizedBox(
//                       width: 5.0,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.deepOrange[100]!,
//                           width: 5.0,
//                         ),
//                         borderRadius: BorderRadius.circular(50.0),
//                       ),
//                       child: CircleAvatar(
//                         backgroundColor: Colors.deepOrange[900],
//                         maxRadius: 3.5,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     SvgPicture.asset(
//                       'assets/img/person.svg',
//                       color: Colors.deepOrange[900],
//                     ),
//                     Text(
//                       'أنت',
//                       textDirection: TextDirection.rtl,
//                       style: TextStyle(
//                         color: Colors.deepOrange[800],
//                         fontSize: 10.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
