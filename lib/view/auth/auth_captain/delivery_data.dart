// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/view/auth/auth_captain/captain_register.dart';
import 'package:shadid/view/widgets/customDropdown.dart';
import 'package:shadid/view/widgets/customTextField.dart';

class DeliveryData extends StatefulWidget {
  static String? serviceType;
  static String? firstName;
  static String? nickName;
  static var selectedType;

  @override
  _DeliveryDataState createState() {
    return _DeliveryDataState();
  }
}

class _DeliveryDataState extends State<DeliveryData> {
  CaptainRegister? captainRegister;
  @override
  void initState() {
    super.initState();
    _dropdownTypeItem = buildDropdownTypeItems(_typeList);
  }

  var serviceTypeCon = TextEditingController();
  var firstNameCon = TextEditingController();
  var nickNameCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('selectPerComFir')}',
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomDropdownButton(
              context: context,
              onBoxStateChanged: (change) => true,
              items: _dropdownTypeItem,
              onChanged: onChangeDropdownTests,
              value: DeliveryData.selectedType,
              hint:
                  '${AppLocalization.of(context)?.getTranslatedValue('locating')}',
            ),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('signAsServiceProvider')}',
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextFormField(
              onChanged: (value) {
                DeliveryData.serviceType = value;
              },
              hintText: 'اكتب الخدمة التي تقدمها',
              controller: serviceTypeCon,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 25.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('nameWillvisibleOnProfile')}',
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextFormField(
              onChanged: (value) {
                DeliveryData.firstName = value;
              },
              controller: firstNameCon,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              hintText:
                  '${AppLocalization.of(context)?.getTranslatedValue('firstName')}',
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextFormField(
              onChanged: (value) {
                DeliveryData.nickName = value;
              },
              controller: nickNameCon,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              hintText:
                  '${AppLocalization.of(context)?.getTranslatedValue('nickName')}',
            ),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('weWillSendJobs')}',
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomDropdownButton(
              context: context,
              onBoxStateChanged: (change) => true,
              items: _dropdownTypeItem,
              onChanged: onChangeDropdownTests,
              value: DeliveryData.selectedType,
              hint:
                  '${AppLocalization.of(context)?.getTranslatedValue('area')}',
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomDropdownButton(
              context: context,
              onBoxStateChanged: (change) => true,
              items: _dropdownTypeItem,
              onChanged: onChangeDropdownTests,
              value: DeliveryData.selectedType,
              hint:
                  '${AppLocalization.of(context)?.getTranslatedValue('city')}',
            ),
          ],
        ),
      ),
    );
  }

  // Type Captain ...
  final List<dynamic> _typeList = [
    {'type': 'فرد'},
    {'type': 'شركة'},
    {'type': 'مؤسسة'}
  ];
  late List<DropdownMenuItem> _dropdownTypeItem;
  // var _selectedTest;
  List<DropdownMenuItem> buildDropdownTypeItems(List testList) {
    List<DropdownMenuItem> items = [];
    for (var i in testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['type']),
        ),
      );
    }
    return items;
  }

  onChangeDropdownTests(selectedTest) {
    setState(() {
      DeliveryData.selectedType = selectedTest;
    });
  }
}
