import 'package:flutter/material.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/widgets/customButton.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class ServiceRating extends StatefulWidget {
  const ServiceRating({Key? key}) : super(key: key);

  @override
  State<ServiceRating> createState() => _ServiceRatingState();
}

class _ServiceRatingState extends State<ServiceRating> {
  double? serviceRating = 0.0;
  bool isRateHiding = false;
  var rateCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontFamily: 'Tajawal',
        ),
        title: const Text('كيف كانت الخدمة التي تلقيتها ؟'),
        leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: primaryColor,
                maxRadius: 60.0,
                child: Image.asset(
                  'assets/img/ex_logo.png',
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                'شركة البراق',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: SimpleStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  rating: 0,
                  size: 25.0,
                  spacing: 2.0,
                  isReadOnly: false,
                  onRated: (rate) {
                    setState(() {
                      serviceRating = rate;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ما رأيك في الخدمة التي تلقيتها ؟'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: rateCon,
                      maxLines: 6,
                      cursorColor: primaryColor,
                      cursorWidth: 1.0,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                      decoration: InputDecoration(
                        hintText: 'اكتب تقييمك....',
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
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Switch.adaptive(
                    activeColor: primaryColor,
                    activeTrackColor: primaryColor.withOpacity(0.3),
                    value: isRateHiding,
                    onChanged: (value) {
                      setState(() {
                        isRateHiding = value;
                      });
                    },
                  ),
                  const Text('إبقاء تقييمي مخفي'),
                ],
              ),
              const Spacer(),
              Builder(builder: (context) {
                if (rateCon.text != '' && serviceRating! > 0) {
                  return CustomButton(
                    onPressed: () {},
                    title: 'إرسال',
                    context: context,
                  );
                }
                return CustomButton(
                  color: Colors.grey,
                  onPressed: () {},
                  title: 'إرسال',
                  context: context,
                );
              }),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
