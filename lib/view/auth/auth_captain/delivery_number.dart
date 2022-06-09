import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/widgets/customTextField.dart';

class DeliveryNumber extends StatefulWidget {
  static String? phoneNum;
  static String? email;
  static String? bankNum;
  @override
  _DeliveryNumberState createState() {
    return _DeliveryNumberState();
  }
}

class _DeliveryNumberState extends State<DeliveryNumber> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var phoneCon = TextEditingController();
  var emailCon = TextEditingController();
  var bankNumCon = TextEditingController();
  var formKeyNum = GlobalKey<FormState>();
  String? code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('phoneNumber')}',
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('weWillConfirmPhoneNum')}',
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Form(
                key: formKeyNum,
                child: SizedBox(
                  height: 50.0,
                  child: IntlPhoneField(
                    controller: phoneCon,
                    validator: (value) {
                      if (value!.number.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    cursorColor: primaryColor,
                    cursorWidth: 1.0,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    flagsButtonMargin:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                    disableLengthCheck: true,
                    showDropdownIcon: false,
                    pickerDialogStyle: PickerDialogStyle(
                        searchFieldCursorColor: primaryColor,
                        searchFieldInputDecoration: InputDecoration(
                          hintText: 'ابحث عن الدولة',
                          hintStyle: const TextStyle(
                            height: 0.0,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: primaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        )),
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontSize: 0.0,
                        height: 0.0,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    initialCountryCode: 'SA',
                    onChanged: (phone) {
                      code = phone.countryCode;
                      DeliveryNumber.phoneNum = phone.completeNumber;
                      debugPrint(DeliveryNumber.phoneNum);
                    },
                    onSaved: (phone) {
                      code = phone?.countryCode;
                      DeliveryNumber.phoneNum = phone!.completeNumber;
                      debugPrint(DeliveryNumber.phoneNum);
                    },
                    onCountryChanged: (Country? country) {
                      code = "+${country?.dialCode}";
                      DeliveryNumber.phoneNum = code! + phoneCon.text;
                      debugPrint(DeliveryNumber.phoneNum);
                    },
                  ),
                ),
              ),
            ),
            //
            const SizedBox(
              height: 30.0,
            ),
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('enterEmail')}',
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('youWillReceiveJobs')}',
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            CustomTextFormField(
              onChanged: (value) {
                DeliveryNumber.email = value;
              },
              controller: emailCon,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            //
            const SizedBox(
              height: 30.0,
            ),
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('bankNumber')}',
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('yourDuesWillSentToBankNum')}',
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            CustomTextFormField(
              onChanged: (value) {
                DeliveryNumber.bankNum = value;
              },
              controller: bankNumCon,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }
}
