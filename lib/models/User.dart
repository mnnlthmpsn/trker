class User {
  String firstname;
  String otherNames;
  String lastname;
  String phone;
  String email;
  String region;
  String gender;
  String postCode;
  String idType;
  String dob;
  String idNumber;

  User(
      {this.firstname,
      this.otherNames,
      this.lastname,
      this.phone,
      this.email,
      this.region,
      this.gender,
      this.postCode,
      this.idNumber,
      this.idType,
      this.dob});

//  add user
    dynamic addUser() async {
      return 'adding ${this.firstname}';
    }
}
