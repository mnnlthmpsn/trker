import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trker/models/User.dart';
import 'package:trker/utils/helpers.dart';
import 'package:trker/utils/size_config.dart';

class KButton extends StatefulWidget {
  final String actionText;
  final Widget redirectPage;
  final IconData actionIcon;
  final bool passed;

  KButton(
      {Key key,
      this.actionText,
      this.redirectPage,
      this.actionIcon,
      this.passed})
      : super(key: key);

  @override
  _KButtonState createState() => _KButtonState();
}

class _KButtonState extends State<KButton> {

  _addUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var fname = prefs.getString('firstname');
    var lname = prefs.getString('lastname');
    var onames = prefs.getString('other names');
    var phone = prefs.getString('phone');
    var email = prefs.getString('email');
    var postCode = prefs.getString('post_code');
    var idNum = prefs.getString('id_number');
    var region = prefs.getString('regions');
    var gender = prefs.getString('gender');
    var idType = prefs.getString('idtype');
    var dob = prefs.getString('dob');

    User obj = User(firstname: fname, lastname: lname, otherNames: onames, phone: phone, email: email, region: region, gender: gender, postCode: postCode, idNumber: idNum, idType: idType, dob: dob );
    obj.addUser();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: SizeConfig.blockSizeHorizontal * 200,
        height: SizeConfig.blockSizeVertical * 9,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  widget.passed ? Colors.green : Colors.grey[200])),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(widget.actionText), Icon(widget.actionIcon)],
          ),
          onPressed: widget.passed
              ? () async {
                  if (widget.actionText == 'Finish'){
                    await _addUser();
                  }
                  dismissKeyboard(context);
                  newPage(context, widget.redirectPage);
                }
              : null,
        ),
      ),
    );
  }
}
