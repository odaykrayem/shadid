// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/model/cacheHelper.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/pages/user_pages/chat.dart';
import 'package:shadid/view/pages/user_pages/search_captain.dart';
import 'package:shadid/view/widgets/customButton.dart';
import 'package:shadid/view/widgets/customCheckBox.dart';

class QuickTrans extends StatefulWidget {
  static String? order;
  const QuickTrans({Key? key}) : super(key: key);

  @override
  State<QuickTrans> createState() => _QuickTransState();
}

class _QuickTransState extends State<QuickTrans> {
  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];
  List<XFile>? selectedImages;
  void selectImages() async {
    selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages!);
    }
    setState(() {});
  }

  var listCon = TextEditingController();
  int selectedStep = 0;
  int nbSteps = 3;
  bool isCooling = false;
  bool isPackaging = false;
  bool isAllInclusive = false;
  int worker = 0;
  int refrigerationConditioning = 0;
  int reassembleAssemble = 0;
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          '${AppLocalization.of(context)?.getTranslatedValue('quickTrans')}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        actions: const [],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.grey[200],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.0,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('pickUp')}',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('trucks')}',
                      ),
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('other')}',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Image.asset('assets/img/beckup_cars.png'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: listCon,
                  maxLines: 6,
                  cursorColor: primaryColor,
                  cursorWidth: 1.0,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                  decoration: InputDecoration(
                    hintText:
                        '${AppLocalization.of(context)?.getTranslatedValue('putListEveryThings')}',
                    filled: true,
                    fillColor: Colors.grey[100],
                    errorStyle: const TextStyle(
                      fontSize: 0.0,
                    ),
                    hintStyle: const TextStyle(
                      fontSize: 12.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey[100]!,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey[100]!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  '${AppLocalization.of(context)?.getTranslatedValue('addImageForTransfed')}',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 45.0,
                  child: Row(
                    children: [
                      DottedBorder(
                        color: primaryColor,
                        strokeWidth: 1.0,
                        dashPattern: const [3],
                        child: SizedBox(
                          height: 45.0,
                          width: 55.0,
                          child: MaterialButton(
                            onPressed: () {
                              selectImages();
                            },
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Expanded(
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification: (notification) {
                            notification.disallowIndicator();
                            return true;
                          },
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: imageFileList!.length,
                              separatorBuilder: (context, i) =>
                                  const SizedBox(width: 5.0),
                              itemBuilder: (BuildContext context, int i) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 45.0,
                                      width: 60.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            File(imageFileList![i].path),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          imageFileList?.removeAt(i);
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: const Icon(
                                          Icons.cancel_outlined,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomCheckBoxListTile(
                  title:
                      '${AppLocalization.of(context)?.getTranslatedValue('coolingTransfed')}',
                  onChanged: (value) {
                    setState(() {
                      isCooling = value!;
                    });
                  },
                  value: isCooling,
                ),
                CustomCheckBoxListTile(
                  title:
                      '${AppLocalization.of(context)?.getTranslatedValue('packagingTransferd')}',
                  onChanged: (value) {
                    setState(() {
                      isPackaging = value!;
                    });
                  },
                  value: isPackaging,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 12.0,
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                            child: Text(
                          '${AppLocalization.of(context)?.getTranslatedValue('upArea')}',
                        )),
                      ],
                    ),
                    Padding(
                      padding: CacheHelper.getData(key: 'languageCode') == 'en'
                          ? const EdgeInsets.only(left: 12.0)
                          : const EdgeInsets.only(right: 12.0),
                      child: Row(
                        children: [
                          Container(
                            height: 100.0,
                            width: 1.0,
                            color: Colors.grey[200],
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Container(
                              height: 50.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${AppLocalization.of(context)?.getTranslatedValue('address')}',
                                  ),
                                  const Icon(Icons.location_on),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 12.0,
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                            child: Text(
                          '${AppLocalization.of(context)?.getTranslatedValue('downArea')}',
                        )),
                      ],
                    ),
                    Padding(
                      padding: CacheHelper.getData(key: 'languageCode') == 'en'
                          ? const EdgeInsets.only(left: 12.0)
                          : const EdgeInsets.only(right: 12.0),
                      child: Row(
                        children: [
                          Container(
                            height: 100.0,
                            width: 1.0,
                            color: Colors.grey[200],
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Container(
                              height: 50.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${AppLocalization.of(context)?.getTranslatedValue('address')}',
                                  ),
                                  const Icon(Icons.location_on),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 12.0,
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Text(
                            '${AppLocalization.of(context)?.getTranslatedValue('selectDay')}',
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: CacheHelper.getData(key: 'languageCode') == 'en'
                          ? const EdgeInsets.only(left: 12.0)
                          : const EdgeInsets.only(right: 12.0),
                      child: Row(
                        children: [
                          Container(
                            height: 100.0,
                            width: 1.0,
                            color: Colors.transparent,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                DateTime? newDate = await showDatePicker(
                                  context: context,
                                  helpText:
                                      '${AppLocalization.of(context)?.getTranslatedValue('selectTransferdDay')}',
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData().copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: primaryColor,
                                          onPrimary: Colors.white,
                                          surface: primaryColor,
                                        ),
                                        dialogTheme: DialogTheme(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  initialDate: dateTime ?? DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.utc(2030, 1, 1),
                                );
                                if (newDate == null) return;
                                setState(() {
                                  dateTime = newDate;
                                });
                              },
                              child: Container(
                                height: 50.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      dateTime == null
                                          ? '${AppLocalization.of(context)?.getTranslatedValue('locate')}'
                                          : '${dateTime!.year} / ${dateTime!.month} / ${dateTime!.day}',
                                      textDirection: TextDirection.ltr,
                                    ),
                                    const Icon(Icons.calendar_month_outlined),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${AppLocalization.of(context)?.getTranslatedValue('worker')}',
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              overlayColor: MaterialStateProperty.all(
                                  primaryColor.withOpacity(0.2)),
                            ),
                            onPressed: () {
                              setState(() {
                                worker++;
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          '$worker',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            height: 2.0,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(0.0)),
                              overlayColor: MaterialStateProperty.all(
                                  primaryColor.withOpacity(0.2)),
                            ),
                            onPressed: () {
                              if (worker >= 1) {
                                setState(() {
                                  worker--;
                                });
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${AppLocalization.of(context)?.getTranslatedValue('refrigerationConditioning')}',
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              overlayColor: MaterialStateProperty.all(
                                  primaryColor.withOpacity(0.2)),
                            ),
                            onPressed: () {
                              setState(() {
                                refrigerationConditioning++;
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          '$refrigerationConditioning',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            height: 2.0,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              overlayColor: MaterialStateProperty.all(
                                  primaryColor.withOpacity(0.2)),
                            ),
                            onPressed: () {
                              if (refrigerationConditioning >= 1) {
                                setState(() {
                                  refrigerationConditioning--;
                                });
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${AppLocalization.of(context)?.getTranslatedValue('reassembleAssemble')}',
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(0.0)),
                              overlayColor: MaterialStateProperty.all(
                                  primaryColor.withOpacity(0.2)),
                            ),
                            onPressed: () {
                              setState(() {
                                reassembleAssemble++;
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          '$reassembleAssemble',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            height: 2.0,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(0.0)),
                              overlayColor: MaterialStateProperty.all(
                                  primaryColor.withOpacity(0.2)),
                            ),
                            onPressed: () {
                              if (reassembleAssemble >= 1) {
                                setState(() {
                                  reassembleAssemble--;
                                });
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomCheckBoxListTile(
                  title:
                      '${AppLocalization.of(context)?.getTranslatedValue('allInclusive')}',
                  onChanged: (value) {
                    setState(() {
                      isAllInclusive = value!;
                    });
                  },
                  value: isAllInclusive,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Builder(builder: (context) {
                  if (listCon.text != '' &&
                      imageFileList!.isNotEmpty &&
                      dateTime != null &&
                      (isCooling != false ||
                          isAllInclusive != false ||
                          isPackaging != false)) {
                    return CustomButton(
                      onPressed: () {
                        QuickTrans.order = listCon.text;
                        Chat.getOrderFrom = GetOrderFrom.quickTrans;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchCaptain(),
                          ),
                        );
                      },
                      title:
                          '${AppLocalization.of(context)?.getTranslatedValue('confirmOrder')}',
                      context: context,
                    );
                  }
                  return CustomButton(
                    color: Colors.grey,
                    onPressed: () {},
                    title:
                        '${AppLocalization.of(context)?.getTranslatedValue('confirmOrder')}',
                    context: context,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
