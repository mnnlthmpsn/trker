import 'package:trker/utils/api.dart';

class User {
  String firstname;
  String othername;
  String lastname;
  String sex;
  String dob;
  String region;
  String district;
  String post_code;
  String phone;
  String email;
  String id_type;
  String id_number;

  User(
      {this.firstname,
      this.othername,
      this.lastname,
      this.phone,
      this.email,
      this.region,
      this.district,
      this.sex,
      this.post_code,
      this.id_number,
      this.id_type,
      this.dob});

//  add user
  dynamic addUser() async {
    User user = User(
      firstname: this.firstname,
      lastname: this.lastname,
      phone: this.phone,
      email: this.email,
      region: this.region,
      district: this.district,
      sex: this.sex,
      post_code: this.post_code,
      id_number: this.id_number,
      id_type: this.id_type,
      dob: this.dob,
    );
    await signup(user)
        .then((res) => print(res))
        .catchError((err) => print(err));
  }
}
