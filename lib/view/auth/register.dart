// ignore_for_file: deprecated_member_use, avoid_print, use_build_context_synchronously, library_prefixes, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/model/cacheHelper.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/auth/otp.dart';
import 'package:shadid/view/widgets/customButton.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:shadid/view/widgets/showToast.dart';

enum UserType { user, captain, nothing }

class Register extends StatefulWidget {
  @override
  _RegisterState createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  Auth.FirebaseAuth auth = Auth.FirebaseAuth.instance;
  String? verificationID;
  UserType type = UserType.nothing;

  var phoneCon = TextEditingController();
  String? code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 75.0,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontFamily: 'Tajawal',
          ),
          centerTitle: true,
          title: Text(
            '${AppLocalization.of(context)?.getTranslatedValue('createAccount')}',
          ),
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${AppLocalization.of(context)?.getTranslatedValue('hi')}',
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Image.asset('assets/img/emoji.png'),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                '${AppLocalization.of(context)?.getTranslatedValue('enterPhone')}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
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
                        hintText:
                            '${AppLocalization.of(context)?.getTranslatedValue('searchCountry')}',
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
                    hintText: '0123456789',
                    hintStyle: const TextStyle(
                      height: 0.0,
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
                  ),
                  initialCountryCode: 'SA',
                  onChanged: (phone) {
                    code = phone.countryCode;
                  },
                  onSaved: (phone) {
                    code = phone?.countryCode;
                  },
                  onCountryChanged: (Country? country) {
                    code = "+${country?.dialCode}";
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<UserType>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      title: Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('user')}',
                      ),
                      activeColor: primaryColor,
                      value: UserType.user,
                      groupValue: type,
                      onChanged: (value) {
                        setState(() {
                          type = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: RadioListTile<UserType>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      title: Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('captain')}',
                      ),
                      activeColor: primaryColor,
                      value: UserType.captain,
                      groupValue: type,
                      onChanged: (value) {
                        setState(() {
                          type = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  if (phoneCon.text != '') {
                    if (type != UserType.nothing) {
                      CacheHelper.saveData(key: 'type', value: '$type');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return OTP(
                          number: code.toString() + phoneCon.text,
                        );
                      }));
                    } else {
                      showToast(
                        text:
                            '${AppLocalization.of(context)?.getTranslatedValue('plzSelectType')}',
                      );
                    }
                  } else {
                    showToast(
                      text:
                          '${AppLocalization.of(context)?.getTranslatedValue('plzEnterPhone')}',
                    );
                  }
                },
                title:
                    '${AppLocalization.of(context)?.getTranslatedValue('sendCode')}',
                context: context,
              ),
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    color: Colors.grey[600],
                    indent: 30.0,
                    endIndent: 30.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: Colors.grey[50],
                    child: Text(
                      '${AppLocalization.of(context)?.getTranslatedValue('orSignBy')}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      maxRadius: 22.0,
                      backgroundColor: Colors.grey[200],
                      child: SvgPicture.asset(
                        'assets/img/apple.svg',
                        width: 25.0,
                        height: 25.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  GestureDetector(
                    child: CircleAvatar(
                      maxRadius: 22.0,
                      backgroundColor: Colors.grey[200],
                      child: SvgPicture.asset('assets/img/facebook.svg'),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  GestureDetector(
                    child: CircleAvatar(
                      maxRadius: 22.0,
                      backgroundColor: Colors.grey[200],
                      child: SvgPicture.asset(
                        'assets/img/google.svg',
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ));
  }
}
