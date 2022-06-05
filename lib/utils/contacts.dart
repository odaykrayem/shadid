// import 'package:cally/utils/custom_icons_icons.dart';
// import 'package:cally/model/appContacts.dart';
// import 'package:cally/theme/my_theme.dart';
// import 'package:cally/utils/constant.dart';
// import 'package:contacts_service/contacts_service.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';

// enum SearchOptions { open, close }

// class Contacts extends StatefulWidget {
//   @override
//   _ContactsState createState() {
//     return _ContactsState();
//   }
// }

// class _ContactsState extends State<Contacts> with WidgetsBindingObserver {
//   List<AppContact> contacts = [];
//   List<AppContact> contactsFiltered = [];

//   TextEditingController searchController = TextEditingController();
//   bool contactsLoaded = true;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);

//     getPermissions();
//     searchController.addListener(() {
//       filterContacts();
//     });
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   Future<void> getPermissions() async {
//     if (await Permission.contacts.request().isGranted) {
//       getAllContacts().then((value) {
//         if (mounted) {
//           setState(() {
//             contactsLoaded = false;
//           });
//         }
//       }).catchError((error) {
//         debugPrint(error);
//       });

//       searchController.addListener(() {
//         filterContacts();
//       });
//     } else {
//       await Permission.contacts.request();
//     }
//   }

//   String flattenPhoneNumber(String phoneStr) {
//     return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
//       return m[0] == "+" ? "+" : "";
//     });
//   }

//   Future<void> getAllContacts() async {
//     List<AppContact> _contacts =
//         (await ContactsService.getContacts()).map((contact) {
//       return AppContact(info: contact);
//     }).toList();
//     setState(() {
//       contacts = _contacts;
//     });
//   }

//   SearchOptions option = SearchOptions.close;

//   @override
//   Widget build(BuildContext context) {
//     bool isSearching = searchController.text.isNotEmpty;
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       floatingActionButton: option == SearchOptions.open
//           ? const SizedBox()
//           : Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: SpeedDial(
//                 animatedIcon: AnimatedIcons.menu_close,
//                 backgroundColor: themeProvider.isDarkMode == true
//                     ? MyTheme.darkTheme.appBarTheme.backgroundColor
//                     : MyTheme.lightTheme.appBarTheme.backgroundColor,
//                 spacing: 20.0,
//                 foregroundColor: Colors.white,
//                 overlayColor: Colors.black,
//                 overlayOpacity: 0.4,
//                 children: [
//                   SpeedDialChild(
//                     child: const Icon(Icons.person_add),
//                     label: 'Add',
//                     onTap: () => ContactsService.openContactForm(),
//                   ),
//                   SpeedDialChild(
//                     child: const Icon(CustomIcons.search),
//                     label: 'Search',
//                     onTap: () => setState(() {
//                       option = SearchOptions.open;
//                     }),
//                   ),
//                 ],
//               ),
//             ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           if (option == SearchOptions.close) {
//             await Future.delayed(
//               const Duration(milliseconds: 1500),
//               () {
//                 setState(() {
//                   contactsLoaded = true;
//                 });
//               },
//             ).then((value) {
//               setState(() {
//                 getAllContacts().then((value) {
//                   if (mounted) {
//                     setState(() {
//                       contactsLoaded = false;
//                     });
//                   }
//                 });
//               });
//             });
//           }
//         },
//         color: primaryPurple,
//         child: Theme(
//           data: ThemeData(
//             colorScheme: ColorScheme.fromSwatch(accentColor: primaryPurple),
//           ),
//           child: contactsLoaded == true
//               ? const Center(
//                   child: CircularProgressIndicator(
//                     color: primaryPurple,
//                   ),
//                 )
//               : SingleChildScrollView(
//                   keyboardDismissBehavior:
//                       ScrollViewKeyboardDismissBehavior.onDrag,
//                   child: contacts.isEmpty
//                       ? Container(
//                           height: MediaQuery.of(context).size.height,
//                           alignment: Alignment.center,
//                           child: Text(
//                             'No Contacts Founded',
//                             style: TextStyle(
//                               color: themeProvider.isDarkMode == true
//                                   ? MyTheme.darkTheme.primaryColor
//                                   : MyTheme.lightTheme.primaryColor,
//                             ),
//                           ),
//                         )
//                       : Column(
//                           children: [
//                             AnimatedCrossFade(
//                               firstChild: Padding(
//                                 padding: const EdgeInsets.only(bottom: 20.0),
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.30,
//                                   decoration: BoxDecoration(
//                                     color: themeProvider.isDarkMode == true
//                                         ? MyTheme.darkTheme.cardColor
//                                         : MyTheme.lightTheme.cardColor,
//                                     borderRadius: const BorderRadius.only(
//                                       bottomLeft: Radius.circular(30.0),
//                                       bottomRight: Radius.circular(30.0),
//                                     ),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                         color: Colors.black26,
//                                         blurRadius: 8.0,
//                                         spreadRadius: 2.0,
//                                         offset: Offset(0.0, 3.0),
//                                       ),
//                                     ],
//                                   ),
//                                   child: SvgPicture.asset(
//                                     'assets/img/Group 2666-min.svg',
//                                     height:
//                                         (MediaQuery.of(context).size.height *
//                                                 0.30) -
//                                             30.0,
//                                   ),
//                                 ),
//                               ),
//                               secondChild: Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   margin: const EdgeInsets.only(bottom: 10.0),
//                                   decoration: const BoxDecoration(
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black26,
//                                         blurRadius: 8.0,
//                                         spreadRadius: 2.0,
//                                         offset: Offset(0.0, 3.0),
//                                       ),
//                                     ],
//                                   ),
//                                   child: TextFormField(
                                    
//                                     controller: searchController,
//                                     cursorWidth: 0.5,
//                                     cursorColor: primaryPurple,
//                                     // textAlign: TextAlign.center,
//                                     textInputAction: TextInputAction.search,
//                                     keyboardType: TextInputType.name,
//                                     style: TextStyle(
//                                       height: 1.0,
//                                       fontSize: 15.0,
//                                       fontFamily: 'Poppins Regular',
//                                       color: themeProvider.isDarkMode == true
//                                           ? MyTheme.darkTheme.primaryColor
//                                           : MyTheme.lightTheme.primaryColor,
//                                     ),
//                                     decoration: InputDecoration(
//                                       suffixIcon: IconButton(
//                                         color: primaryPurple,
//                                         onPressed: () {
//                                           setState(() {
//                                             option = SearchOptions.close;
//                                             setState(() {
//                                               searchController.clear();
//                                             });
//                                           });
//                                         },
//                                         icon: const Icon(Icons.close),
//                                       ),
//                                       filled: true,
//                                       fillColor:
//                                           themeProvider.isDarkMode == true
//                                               ? MyTheme.darkTheme.cardColor
//                                               : MyTheme.lightTheme.cardColor,
//                                       errorStyle: const TextStyle(
//                                         fontSize: 0.0,
//                                         height: 0.0,
//                                       ),
//                                       hintText: 'Search',
//                                       hintStyle: TextStyle(
//                                         fontSize: 15.0,
//                                         fontFamily: 'Poppins Regular',
//                                         color: themeProvider.isDarkMode == true
//                                             ? MyTheme.darkTheme.primaryColor
//                                             : MyTheme.lightTheme.primaryColor,
//                                       ),
//                                       disabledBorder: OutlineInputBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(12.0),
//                                         borderSide: BorderSide(
//                                           color: themeProvider.isDarkMode ==
//                                                   true
//                                               ? MyTheme.darkTheme.cardColor
//                                               : MyTheme.lightTheme.cardColor,
//                                         ),
//                                       ),
//                                       border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: themeProvider.isDarkMode ==
//                                                   true
//                                               ? MyTheme.darkTheme.cardColor
//                                               : MyTheme.lightTheme.cardColor,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(12.0),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: const BorderSide(
//                                           color: primaryPurple,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(12.0),
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                           color: themeProvider.isDarkMode ==
//                                                   true
//                                               ? MyTheme.darkTheme.cardColor
//                                               : MyTheme.lightTheme.cardColor,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(12.0),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               crossFadeState: option == SearchOptions.open
//                                   ? CrossFadeState.showSecond
//                                   : CrossFadeState.showFirst,
//                               duration: const Duration(milliseconds: 300),
//                             ),
//                             ListView.separated(
//                               physics: const NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: isSearching == true
//                                   ? contactsFiltered.length
//                                   : contacts.length,
//                               separatorBuilder: (context, i) => const Divider(),
//                               itemBuilder: (context, i) {
//                                 AppContact contact = isSearching == true
//                                     ? contactsFiltered[i]
//                                     : contacts[i];
//                                 String customAvatar =
//                                     '${contact.info.displayName?.trim().split(' ').map((l) => l[0]).take(1).join().replaceAll(RegExp('[^A-Za-z-ا-ي-آ-أ-إ]'), '').toUpperCase()}';
//                                 return ContactItem(
//                                   delete: () {
//                                     showDialog<void>(
//                                       context: context,
//                                       barrierDismissible: false,
//                                       builder: (BuildContext dialogContext) {
//                                         return AlertDialog(
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(20.0),
//                                           ),
//                                           backgroundColor: primaryPurple,
//                                           alignment: Alignment.center,
//                                           titleTextStyle: const TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: 'Helvetica New Bold',
//                                             fontSize: 20.0,
//                                           ),
//                                           title: const Text('Delete'),
//                                           contentTextStyle: const TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: 'Helvetica New Medium',
//                                           ),
//                                           content: Text(
//                                               'Are you sure to delete\n${contact.info.displayName} ?'),
//                                           actions: <Widget>[
//                                             TextButton(
//                                               style: ButtonStyle(
//                                                 foregroundColor:
//                                                     MaterialStateProperty.all(
//                                                         Colors.red),
//                                                 overlayColor: MaterialStateColor
//                                                     .resolveWith((states) =>
//                                                         Colors.grey),
//                                               ),
//                                               child: const Text(
//                                                 'Delete',
//                                                 style: TextStyle(
//                                                   color: Colors.yellow,
//                                                   fontFamily:
//                                                       'Helvetica New Medium',
//                                                 ),
//                                               ),
//                                               onPressed: () {
//                                                 Navigator.pop(dialogContext);
//                                                 ContactsService.deleteContact(
//                                                         contact.info)
//                                                     .then((value) {
//                                                   setState(() {
//                                                     contactsLoaded = true;
//                                                   });
//                                                 }).then((value) {
//                                                   setState(() {
//                                                     getAllContacts()
//                                                         .then((value) {
//                                                       if (mounted) {
//                                                         setState(() {
//                                                           contactsLoaded =
//                                                               false;
//                                                         });
//                                                       }
//                                                     });
//                                                   });
//                                                 });
//                                               },
//                                             ),
//                                             TextButton(
//                                               style: ButtonStyle(
//                                                 overlayColor: MaterialStateColor
//                                                     .resolveWith((states) =>
//                                                         Colors.grey),
//                                               ),
//                                               child: const Text(
//                                                 'Cancel',
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontFamily:
//                                                       'Helvetica New Medium',
//                                                 ),
//                                               ),
//                                               onPressed: () {
//                                                 Navigator.of(dialogContext)
//                                                     .pop(); // Dismiss alert dialog
//                                               },
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     );
//                                   },
//                                   edit: () {
//                                     ContactsService.openExistingContact(
//                                         contact.info);
//                                   },
//                                   name: '${contact.info.displayName}',
//                                   nickname: contact.info.phones!.isNotEmpty
//                                       ? '${contact.info.phones?.elementAt(0).value}'
//                                       : '',
//                                   avatar: contact.info.avatar!.isNotEmpty
//                                       ? CircleAvatar(
//                                           foregroundColor: primaryPurple,
//                                           maxRadius: 40.0,
//                                           backgroundImage: MemoryImage(
//                                             contact.info.avatar!,
//                                           ),
//                                         )
//                                       : customAvatar == ''
//                                           ? CircleAvatar(
//                                               backgroundColor: themeProvider
//                                                           .isDarkMode ==
//                                                       true
//                                                   ? MyTheme.darkTheme.cardColor
//                                                   : MyTheme
//                                                       .lightTheme.cardColor,
//                                               foregroundColor: primaryPurple,
//                                               maxRadius: 40.0,
//                                               child: const Icon(
//                                                   CupertinoIcons.person_alt),
//                                             )
//                                           : CircleAvatar(
//                                               backgroundColor: themeProvider
//                                                           .isDarkMode ==
//                                                       true
//                                                   ? MyTheme.darkTheme.cardColor
//                                                   : MyTheme
//                                                       .lightTheme.cardColor,
//                                               foregroundColor: primaryPurple,
//                                               maxRadius: 40.0,
//                                               child: Text(
//                                                 customAvatar,
//                                                 style: const TextStyle(
//                                                   fontSize: 30.0,
//                                                   fontFamily:
//                                                       'Helvetica New Bold',
//                                                 ),
//                                               ),
//                                             ),
//                                 );
//                               },
//                             ),
//                             const SizedBox(
//                               height: 20.0,
//                             ),
//                           ],
//                         ),
//                 ),
//         ),
//       ),
//     );
//   }

//   filterContacts() {
//     List<AppContact> _contacts = [];
//     _contacts.addAll(contacts);
//     if (searchController.text.isNotEmpty) {
//       _contacts.retainWhere((contact) {
//         String searchTerm = searchController.text.toLowerCase();
//         String searchTermFlatten = flattenPhoneNumber(searchTerm);
//         String contactName = "${contact.info.displayName?.toLowerCase()}";
//         bool nameMatches = contactName.contains(searchTerm);
//         if (nameMatches == true) {
//           return true;
//         }

//         if (searchTermFlatten.isEmpty) {
//           return false;
//         }

//         return true;
//       });
//     }
//     setState(() {
//       contactsFiltered = _contacts;
//     });
//   }

//   Widget ContactItem({
//     required String name,
//     required String nickname,
//     required Widget avatar,
//     required VoidCallback? delete,
//     required VoidCallback? edit,

//     // VoidCallback? onLongPress,
//     // bool selected = false,
//   }) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     return ListTile(
//       // onLongPress: onLongPress,
//       // selected: selected,
//       title: Text(
//         name,
//         style: TextStyle(
//           fontFamily: 'Poppins Regular',
//           color: themeProvider.isDarkMode == true
//               ? MyTheme.darkTheme.primaryColor
//               : MyTheme.lightTheme.primaryColor,
//           fontSize: 18.0,
//         ),
//       ),
//       subtitle: Text(
//         nickname,
//         style: TextStyle(
//           color: themeProvider.isDarkMode == true
//               ? MyTheme.darkTheme.primaryColor
//               : MyTheme.lightTheme.primaryColor,
//           fontFamily: 'Poppins Regular',
//         ),
//       ),
//       leading: avatar,
//       trailing: PopupMenuButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         icon: Icon(
//           Icons.more_vert,
//           color: themeProvider.isDarkMode == true
//               ? MyTheme.darkTheme.primaryColor
//               : MyTheme.lightTheme.primaryColor,
//         ),
//         color: themeProvider.isDarkMode == true
//             ? MyTheme.darkTheme.popupMenuTheme.color
//             : MyTheme.lightTheme.popupMenuTheme.color,
//         itemBuilder: (context) {
//           return <PopupMenuEntry>[
//             PopupMenuItem(
//               onTap: edit,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Edit',
//                     style: TextStyle(
//                       fontFamily: 'Poppins Regular',
//                       color: themeProvider.isDarkMode == true
//                           ? MyTheme.darkTheme.primaryColor
//                           : MyTheme.lightTheme.primaryColor,
//                     ),
//                   ),
//                   Icon(
//                     Icons.edit,
//                     color: themeProvider.isDarkMode == true
//                         ? MyTheme.darkTheme.primaryColor
//                         : MyTheme.lightTheme.primaryColor,
//                   ),
//                 ],
//               ),
//             ),
//             PopupMenuItem(
//               onTap: delete,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Delete',
//                     style: TextStyle(
//                       fontFamily: 'Poppins Regular',
//                       color: themeProvider.isDarkMode == true
//                           ? MyTheme.darkTheme.primaryColor
//                           : MyTheme.lightTheme.primaryColor,
//                     ),
//                   ),
//                   Icon(
//                     Icons.delete_forever,
//                     color: themeProvider.isDarkMode == true
//                         ? MyTheme.darkTheme.primaryColor
//                         : MyTheme.lightTheme.primaryColor,
//                   ),
//                 ],
//               ),
//             ),
//           ];
//         },
//       ),
//     );
//   }
// }
