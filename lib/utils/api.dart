import 'package:http/http.dart' as http;
import 'dart:convert';

var url = 'https://crustsolutionsgh.com:8308';

Future signup(user) async {
  var data = {
    'firstname': user['firstname'],
    'lastname': user['lastname'],
    'othername': user['othername'],
    'phone': user['phone'],
    'email': user['email'],
    'region': user['region'],
    'district': user['district'],
    'sex': user['sex'],
    'post_code': user['post_code'],
    'id_type': user['id_type'],
    'id_number': user['id_number'],
    'dob': user['dob']
  };
  var headers = {"Content-Type": "application/json;charset=UTF-8"};

  // convert to json format
  var encode = json.encode(data);

  // make api call and return response
  return await http
      .post(Uri.parse(url + '/signup'), headers: headers, body: encode)
      .then((response) {
    return jsonDecode(response.body);
  }).catchError((err) {
    throw err;
  });
}

Future validate(phone, code) async {
  var data = {
    "phone": phone,
    "validation_code": code
  };

  var headers = {"Content-Type": "application/json;charset=UTF-8"};
  var encode = json.encode(data);

  return await http
      .post(Uri.parse(url + '/validate'), headers: headers, body: encode)
      .then((response) => jsonDecode(response.body))
      .catchError((err) => throw err);
}

Future resendOTP(phone) async {
  var data = {
    "phone": phone,
    "key":  "123qwe!@#"
  };

  var headers = {"Content-Type": "application/json;charset=UTF-8"};
  var encode = json.encode(data);

  return await http
      .post(Uri.parse(url + '/resend_pin'), headers: headers, body: encode)
      .then((response) => jsonDecode(response.body))
      .catchError((err) => throw err);
}