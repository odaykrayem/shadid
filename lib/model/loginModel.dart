// ignore_for_file: non_constant_identifier_names, file_names, prefer_typing_uninitialized_variables

class UserData {
  dynamic phone;

  dynamic api_token;

  UserData.fromJson(Map<String, dynamic> json) {
    phone = json['phone_number'];

    api_token = json['api_token'];
  }
}

class CaptainData {
  dynamic phone;

  dynamic api_token;

  CaptainData.fromJson(Map<String, dynamic> json) {
    phone = json['phone_number'];

    api_token = json['api_token'];
  }
}
