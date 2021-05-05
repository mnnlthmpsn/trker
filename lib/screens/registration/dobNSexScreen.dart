import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trker/components/DoubleFields.dart';
import 'package:trker/components/KDropdownField.dart';
import 'package:trker/screens/registration/locationScreen.dart';
import 'package:trker/utils/helpers.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:trker/utils/size_config.dart';


class DobNSexScreen extends StatefulWidget {
  @override
  _DobNSexScreenState createState() => _DobNSexScreenState();
}

class _DobNSexScreenState extends State<DobNSexScreen> {
  bool show = false;
  String _chosenDate = 'Date of Birth';
  var genderController = TextEditingController();
  var dobController = TextEditingController();
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = new FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        dismissKeyboard(context);
        if (genderController.text.isNotEmpty && dobController.text.isNotEmpty) {
          setState(() {
            show = true;
          });
        }
      }
    });
  }

  _setSharedPreference(val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dob', '${val.year}-${val.month}-${val.day}');
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: DoubleField(
        widget1: KDropdownField(items: ['male', 'female'], textLabel: 'Gender',),
        widget2: SizedBox(
          height: SizeConfig.blockSizeVertical * 8.5,
          child: OutlinedButton(
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1950, 31, 12),
                    maxTime: DateTime(2018, 31, 12), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      _setSharedPreference(date);
                      setState(() {
                        _chosenDate = '${date.year}-${date.month}-${date.day}';
                        show = true;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Text(
                _chosenDate, style: TextStyle(color: Colors.black54, fontSize: 20),
              )),
        ),

        actionText: "Continue",
        actionIcon: Icons.arrow_forward_rounded,
        passed: this.show,
        pageNumber: 4,
        redirectPage: LocationScreen(),
      ),
    );
  }
}
