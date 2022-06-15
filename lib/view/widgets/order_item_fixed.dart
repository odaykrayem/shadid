import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/utils/styles.dart';
import 'package:shadid/view/pages/user_pages/orders.dart';

class OrderItemFixed extends StatefulWidget {
  final String title;
  final String date;
  final String location;
  final OrderType type; //@oday: not sure about this fianl or static ^^

  const OrderItemFixed(
      {Key? key,
      required this.title,
      required this.type,
      required this.date,
      required this.location})
      : super(key: key);

  @override
  State<OrderItemFixed> createState() => _OrderItemFixedState();
}

class _OrderItemFixedState extends State<OrderItemFixed> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        child: Column(
          children: [
            Padding(
              padding: paddingTitle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: titleTextStyle,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.more_vert,
                        color: colorGrey,
                      ))
                ],
              ),
            ),
            Padding(
              padding: paddingLine,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.calendar_month, color: colorLightOrange),
                  Padding(
                    padding: paddingText,
                    child: Text(
                      widget.date,
                      style: normalTextStyle,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: paddingLine,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.location_on, color: colorDarkBlue),
                  Padding(
                    padding: paddingText,
                    child: Text(
                      widget.location,
                      style: normalTextStyle,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: paddingLine,
              child: InkWell(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.call, color: colorLightBlue),
                    Padding(
                      padding: paddingText,
                      child: Align(
                        child: Text(
                          '${AppLocalization.of(context)?.getTranslatedValue('youCanCall')}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: (widget.type == OrderType.existing)
                                ? colorCallMeTextEnabled
                                : colorCallMeTextDisabled,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: paddingFooter,
              child: widget.type == OrderType.existing
                  ? footerOption2(context)
                  : footerOption1(context),
            )
          ],
        ),
      ),
    );
  }

  Padding footerOption2(BuildContext context) {
    return Padding(
      padding: paddingLine,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: paddingDivider,
              child: Text(
                '${AppLocalization.of(context)?.getTranslatedValue('youWillBeNotified')}',
                style: normalTextStyle,
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primaryColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            child: Text(
              '${AppLocalization.of(context)?.getTranslatedValue('offersAndPrices')}',
              style: normalTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget footerOption1(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: paddingDivider,
          child: Divider(
            height: 1,
            thickness: 2,
            color: colorDivider.withOpacity(0.5),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: paddingLine,
            child: Text(
              (widget.type == OrderType.canceled)
                  ? '${AppLocalization.of(context)?.getTranslatedValue('canceledOrders')}'
                  : '${AppLocalization.of(context)?.getTranslatedValue('completedOrders')}',
              style: titleTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
