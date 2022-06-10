// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shadid/view/pages/user_pages/orders.dart';

class Order {
  String id;
  String description;
  String date;
  OrderType orderType;

  Order(
      {required this.id,
      required this.description,
      required this.date,
      required this.orderType});
}
