// ignore_for_file: non_constant_identifier_names, file_names, prefer_typing_uninitialized_variables

class UserData {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic phone_number;
  dynamic gender;
  dynamic api_token;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone_number = json['phone_number'];
    gender = json['gender'];

    api_token = json['api_token'];
  }
}
