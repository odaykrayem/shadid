// ignore_for_file: non_constant_identifier_names, file_names, prefer_typing_uninitialized_variables

class UserData {
  int id;
  String? phone;
  String? fullName;
  String? api_token;
  String? email;
  String? type;
  String? service;
  bool isNew;
  String? balance;
  String?user_image;
  String? stars_average;




    UserData({
     required this.id,

     required this.isNew,

    }

        );




  // ignore: empty_constructor_bodies
  factory UserData.fromJson(Map<String, dynamic> json) {
   return UserData(
     id : json['id'] as int,


    isNew : json['isnew'] as bool,


   );}
}

class CaptainData {
  dynamic id;
  dynamic phone;
  dynamic fullName;
  dynamic api_token;
  dynamic email;
  dynamic workType;
  dynamic service;
  dynamic isNew;
  dynamic balance;
  dynamic user_image;
  dynamic stars_average;

  CaptainData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone_number'];
    fullName = json['name'];
    api_token = json['api_token'];
    email = json['email'];
    workType = json['type'];
    service = json['service'];
    isNew = json['isnew'];
    balance = json['balance'];
    user_image = json['user_image'];
    stars_average = json['stars_average'];
  }
}

/*
token:pBs06KfcK0UDdqAj96goomLmAbyz2wDDrF7CcZ1jv51xS9ZyPnDBD6uZkYaU
user2_id:2
payment_type:1
dilever_cost:1
order_bill:1
tax_value:2
earn_value:2
total_bill:2
order_status:4
client_order_status:1
driver_order_status:3
order_date:2022-06-12 
order_status:1
receiving_location:ksa
receiving_x:1.1
receiving_y:2.2
delivery_location:ksa
delivery_x:1.2
delivery_y:2.2
distance:300
worker:200
installation_technician:1
technician:1
need_worker:1
notes:test
 */