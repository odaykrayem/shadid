import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/pages/user_pages/chat.dart';
import 'package:shadid/view/pages/user_pages/search_captain.dart';
import 'package:shadid/view/widgets/customButton.dart';

class Others extends StatefulWidget {
  static String? order;
  const Others({Key? key}) : super(key: key);

  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
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

  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          '${AppLocalization.of(context)?.getTranslatedValue('other')}',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
                        ),
                        Text(
                          '${AppLocalization.of(context)?.getTranslatedValue('trucks')}',
                        ),
                        Text(
                          '${AppLocalization.of(context)?.getTranslatedValue('other')}',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
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
                    child: Image.asset('assets/img/other_cars.png'),
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
                          '${AppLocalization.of(context)?.getTranslatedValue('writeRequiredService')}',
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
                  Text(
                    '${AppLocalization.of(context)?.getTranslatedValue('location')}',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 50.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${AppLocalization.of(context)?.getTranslatedValue('address')}',
                        ),
                        const Icon(Icons.location_on),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '${AppLocalization.of(context)?.getTranslatedValue('selectDay')}',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
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
                                  borderRadius: BorderRadius.circular(20.0),
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
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Builder(builder: (context) {
                  if (listCon.text != '' &&
                      imageFileList!.isNotEmpty &&
                      dateTime != null) {
                    return CustomButton(
                      onPressed: () {
                        Others.order = listCon.text;
                        Chat.getOrderFrom = GetOrderFrom.others;
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
