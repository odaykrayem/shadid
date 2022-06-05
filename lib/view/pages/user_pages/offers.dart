import 'package:flutter/material.dart';
import 'package:shadid/localization/localization.dart';
import 'package:shadid/utils/constant.dart';
import 'package:shadid/view/pages/user_pages/chat.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<Map<String, dynamic>> offers = [
    {
      'name': 'محمد ابراهيم',
      'rate': '4.5',
      'price': 100.0,
      'color': primaryColor,
    },
    {
      'name': 'مؤسسة النصر',
      'rate': '4.2',
      'price': 150.0,
      'color': Colors.red,
    },
    {
      'name': 'شركة الأحمد',
      'rate': '4.8',
      'price': 200.0,
      'color': Colors.blue,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 22.0,
          fontFamily: 'Tajawal',
        ),
        title: Text(
          '${AppLocalization.of(context)?.getTranslatedValue('offersDelivery')}',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.grey[300],
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(
              const Duration(seconds: 2),
            );
          },
          color: primaryColor,
          child: ListView.separated(
            itemCount: offers.length,
            separatorBuilder: (context, i) => const SizedBox(height: 10.0),
            itemBuilder: (context, i) {
              return Column(
                children: [
                  if (i == 0)
                    const SizedBox(
                      height: 10.0,
                    ),
                  offerItem(
                    name: offers[i]['name'],
                    rate: offers[i]['rate'],
                    price: offers[i]['price'],
                    color: offers[i]['color'],
                    onChoicOffer: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Chat(
                          color: offers[i]['color'],
                          price: offers[i]['price'],
                        );
                      }));
                    },
                    onIgnorOffer: () {
                      offers.removeAt(i);
                      setState(() {});
                    },
                  ),
                  if (i == offers.length - 1)
                    const SizedBox(
                      height: 20.0,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget offerItem({
    required String name,
    required String rate,
    required double price,
    required Color color,
    required void Function()? onChoicOffer,
    required void Function()? onIgnorOffer,
  }) {
    return Container(
      height: 80.0,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        title: Text(name),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              rate,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.5,
              ),
            ),
            const Icon(
              Icons.star_rounded,
              color: Colors.amber,
              size: 18.0,
            ),
          ],
        ),
        leading: CircleAvatar(
          backgroundColor: color,
          maxRadius: 24.0,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(0.0)),
                      overlayColor: MaterialStateProperty.all(
                          primaryColor.withOpacity(0.2)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green[100]),
                    ),
                    onPressed: onChoicOffer,
                    child: Icon(
                      Icons.done,
                      size: 20.0,
                      color: Colors.green[700],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(0.0)),
                      overlayColor: MaterialStateProperty.all(
                          Colors.red.withOpacity(0.2)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[100]),
                    ),
                    onPressed: onIgnorOffer,
                    child: Icon(
                      Icons.close,
                      size: 20.0,
                      color: Colors.red[700],
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '${AppLocalization.of(context)?.getTranslatedValue('deliveryPrice')} $price',
              style: const TextStyle(
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
