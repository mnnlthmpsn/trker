import 'package:shared_preferences/shared_preferences.dart';
import 'package:trker/screens/OTPScreen.dart';
import 'package:trker/screens/dashboard.dart';
import 'package:trker/utils/api.dart';
import 'package:trker/utils/helpers.dart';

class User {
//  add user
  dynamic addUser(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var user = {
      'firstname': prefs.get('firstname'),
      'lastname': prefs.get('lastname'),
      'othername': prefs.get('other_names'),
      'phone': prefs.get('phone'),
      'email': prefs.get('email'),
      'region': prefs.get('region'),
      'district': prefs.get('district'),
      'sex': prefs.get('sex'),
      'post_code': prefs.get('post_code'),
      'id_number': prefs.get('id_number'),
      'id_type': prefs.get('id_type'),
      'dob': prefs.get('dob'),
    };

    await signup(user).then((res) {
      if (res['status'] == '3' || res['status'] == '2') {
        // throw "Account already exists";
        newPageDestroyPrevious(context, Dashboard());
      } else if (res['status'] == '1') {
        newPageDestroyPrevious(context, OTPScreen());
      } else {
        throw "An error occured";
      }
    }).catchError((err) {
      showSnack(context, err.toString());
    });
  }
}
