// ignore_for_file: unnecessary_string_interpolations

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/model/cacheHelper.dart';
import 'package:shadid/model/cubit.dart';
import 'package:shadid/model/states.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/auth/auth_captain/delivery_data.dart';
import 'package:shadid/view/auth/auth_captain/delivery_number.dart';
import 'package:shadid/view/pages/captain_pages/captain_home.dart';
import 'package:shadid/view/widgets/customButton.dart';
import 'package:shadid/view/widgets/showToast.dart';

class Images extends StatefulWidget {
  @override
  _ImagesState createState() {
    return _ImagesState();
  }
}

class _ImagesState extends State<Images> {
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
    return BlocProvider(
      create: (context) => RegisterCaptainCubit(),
      child: BlocConsumer<RegisterCaptainCubit, RegisterCaptainStates>(
        listener: (context, state) {
          if (state is RegisterCaptainErrorState) {
            showToast(text: 'حدث خطأ أثناء التسجيل');
          }
          if (state is RegisterCaptainSuccessState) {
            showToast(text: 'تم تسجيلك بنجاح');
            CacheHelper.saveData(key: 'id', value: '${state.captainData.id}');
            CacheHelper.saveData(
                key: 'phone', value: "${state.captainData.phone}");
            CacheHelper.saveData(
                key: 'email', value: "${state.captainData.email}");
            CacheHelper.saveData(
                key: 'fullName', value: "${state.captainData.fullName}");
            CacheHelper.saveData(
                key: 'api_token', value: "${state.captainData.api_token}");
            CacheHelper.saveData(
                key: 'service', value: "${state.captainData.service}");
            CacheHelper.saveData(
                key: 'workType', value: "${state.captainData.workType}");
            CacheHelper.saveData(
                key: 'user_image', value: '${state.captainData.user_image}');
            CacheHelper.saveData(
                key: 'balance', value: '${state.captainData.balance}');
            CacheHelper.saveData(key: 'isCaptainRegistered', value: true);
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return CaptainHome();
            }), (route) => false);
          }
        },
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      // Profile Image
                      //
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('imageProfile')}',
                        style: const TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('mustBeSelfiNow')}',
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 60.0,
                        child: Row(
                          children: [
                            if (profileImage == null)
                              DottedBorder(
                                color: primaryColor,
                                strokeWidth: 1.0,
                                dashPattern: const [3],
                                child: SizedBox(
                                  height: 60.0,
                                  width: 60.0,
                                  child: MaterialButton(
                                    onPressed: () {
                                      pickProfileImage();
                                    },
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 5.0),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 45.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: profileImage == null
                                      ? const SizedBox()
                                      : Image.file(
                                          profileImage!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                if (profileImage != null)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        profileImage = null;
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
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      //
                      // Id Card Image
                      //
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('idCard')}',
                        style: const TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('idCardEhance')}',
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 60.0,
                        child: Row(
                          children: [
                            if (cardImage == null)
                              DottedBorder(
                                color: primaryColor,
                                strokeWidth: 1.0,
                                dashPattern: const [3],
                                child: SizedBox(
                                  height: 60.0,
                                  width: 60.0,
                                  child: MaterialButton(
                                    onPressed: () {
                                      pickCardImage();
                                    },
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 5.0),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 45.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: cardImage == null
                                      ? const SizedBox()
                                      : Image.file(
                                          cardImage!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                if (cardImage != null)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cardImage = null;
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
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      //
                      // Car Images
                      //
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('carImg')}',
                        style: const TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('carImgForeBack')}',
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 60.0,
                        child: Row(
                          children: [
                            if (carImagesList!.length <= 1)
                              DottedBorder(
                                color: primaryColor,
                                strokeWidth: 1.0,
                                dashPattern: const [3],
                                child: SizedBox(
                                  height: 60.0,
                                  width: 60.0,
                                  child: MaterialButton(
                                    onPressed: () {
                                      carImages();
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
                                    itemCount: carImagesList!.length,
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
                                                  File(carImagesList![i].path),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                carImagesList?.removeAt(i);
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
                      //
                      // Car Form Image
                      //
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('carForm')}',
                        style: const TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('carFormEhance')}',
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 60.0,
                        child: Row(
                          children: [
                            if (carForm == null)
                              DottedBorder(
                                color: primaryColor,
                                strokeWidth: 1.0,
                                dashPattern: const [3],
                                child: SizedBox(
                                  height: 60.0,
                                  width: 60.0,
                                  child: MaterialButton(
                                    onPressed: () {
                                      pickCarFormImage();
                                    },
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 5.0),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 45.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: carForm == null
                                      ? const SizedBox()
                                      : Image.file(
                                          carForm!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                if (carForm != null)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        carForm = null;
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
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      //
                      // Insurance Image
                      //
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('insuranceImg')}',
                        style: const TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('insuranceImgEhance')}',
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 60.0,
                        child: Row(
                          children: [
                            if (insuranceImage == null)
                              DottedBorder(
                                color: primaryColor,
                                strokeWidth: 1.0,
                                dashPattern: const [3],
                                child: SizedBox(
                                  height: 60.0,
                                  width: 60.0,
                                  child: MaterialButton(
                                    onPressed: () {
                                      pickInsuranceImage();
                                    },
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 5.0),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 45.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: insuranceImage == null
                                      ? const SizedBox()
                                      : Image.file(
                                          insuranceImage!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                if (insuranceImage != null)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        insuranceImage = null;
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
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      //
                      // Authorization Image
                      //
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('authorizationCar')}',
                        style: const TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${AppLocalization.of(context)?.getTranslatedValue('ifYouAuthorizedCar')}',
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 60.0,
                        child: Row(
                          children: [
                            if (authorizationImage == null)
                              DottedBorder(
                                color: primaryColor,
                                strokeWidth: 1.0,
                                dashPattern: const [3],
                                child: SizedBox(
                                  height: 60.0,
                                  width: 60.0,
                                  child: MaterialButton(
                                    onPressed: () {
                                      pickAuthorizationImage();
                                    },
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 5.0),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 45.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: authorizationImage == null
                                      ? const SizedBox()
                                      : Image.file(
                                          authorizationImage!,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                if (authorizationImage != null)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        authorizationImage = null;
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
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Builder(
                        builder: (context) {
                          if (state is RegisterCaptainLoadingState) {
                            return Container(
                              alignment: Alignment.center,
                              height: 55.0,
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            );
                          }
                          if (profileImage != null &&
                              cardImage != null &&
                              carForm != null &&
                              insuranceImage != null &&
                              selectedImages != null &&
                              carImagesList!.length == 2) {
                            return CustomButton(
                              onPressed: () {
                                CacheHelper.saveData(
                                    key: 'isCaptainRegistered', value: true);
                                RegisterCaptainCubit.get(context)
                                    .CaptainRegister(
                                  phone: "${DeliveryNumber.phoneNum}",
                                  email: "${DeliveryNumber.email}",
                                  ban_info: "${DeliveryNumber.bankNum}",
                                  type: "${DeliveryData.serviceType}",
                                  name:
                                      "${DeliveryData.firstName} ${DeliveryData.nickName}",
                                  service:
                                      "${DeliveryData.selectedType['type']}",
                                );
                              },
                              title: 'تسجيل',
                              context: context,
                            );
                          }
                          return CustomButton(
                            onPressed: () {
                              showToast(
                                text:
                                    '${AppLocalization.of(context)?.getTranslatedValue('makeSureUploadReqImg')}',
                              );
                            },
                            color: Colors.grey,
                            title:
                                '${AppLocalization.of(context)?.getTranslatedValue('register')}',
                            context: context,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  //
  // Camera Functions ...
  //
  //

  File? profileImage;
  File? cardImage;
  File? carForm;
  File? insuranceImage;
  File? authorizationImage;

  Future pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        profileImage = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint("Failed to pick image : $e");
    }
  }

  Future pickCardImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        cardImage = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint("Failed to pick image : $e");
    }
  }

  Future pickCarFormImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        carForm = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint("Failed to pick image : $e");
    }
  }

  Future pickInsuranceImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        insuranceImage = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint("Failed to pick image : $e");
    }
  }

  Future pickAuthorizationImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        authorizationImage = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint("Failed to pick image : $e");
    }
  }

  final ImagePicker carImagesPicker = ImagePicker();

  List<XFile>? carImagesList = [];
  List<XFile>? selectedImages;
  void carImages() async {
    selectedImages = await carImagesPicker.pickMultiImage();

    if (selectedImages!.isNotEmpty) {
      carImagesList!.addAll(selectedImages!);
    }
    setState(() {});
  }
}
