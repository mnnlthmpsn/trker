import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trker/models/User.dart';
import 'package:trker/utils/helpers.dart';
import 'package:trker/utils/constants.dart';
import 'package:intl/intl.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  int _currentStep = 0;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _buttonDone = false;
  bool _loading = false;

  // controllers
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController onameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController pcodeController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();

  // chosen Values
  String _chosenValue;
  String _chosenRegion;
  String _chosenDate = 'Date of Birth';
  String _chosenIDType;

  // sex and regions dropdown items
  var sex = ['Male', 'Female'];
  var regions = ['Greater Accra', 'Central Region'];
  var id_types = [
    'Voter\'s',
    'Ghana Card',
    'NHIS',
    'Driver\'s License',
    'Passport'
  ];

  _tapped(int step) => setState(() => _currentStep = step);

  void _continue() => _currentStep >= 0 && _currentStep < 2
      ? setState(() => _currentStep += 1)
      : null;


  _finished() async {
    if (_formKey.currentState.validate() == false) {
      // change icon from finish
      setState(() {
        _buttonDone = false;
      });
    } else if (_chosenIDType == null) {
      showSnack(context, 'ID Type field can\'t be empty');
    } else if (_chosenDate == null) {
      showSnack(context, 'Date of Birth field can\'t be empty');
    } else if (_chosenRegion == null) {
      showSnack(context, 'Region field can\'t be empty');
    } else if (_chosenValue == null) {
      showSnack(context, 'Gender field can\'t be empty');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // set sharedPreferences here
      prefs.setString('firstname', fnameController.text);
      prefs.setString('lastname', lnameController.text);
      prefs.setString('other_names', onameController.text);
      prefs.setString('phone', phoneController.text);
      prefs.setString('email', emailController.text);
      prefs.setString('district', districtController.text);
      prefs.setString('post_code', pcodeController.text);
      prefs.setString('id_number', idNumberController.text);

      setState(() {
        _loading = true;
      });
      var user = User();
      await user.addUser(context);
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    colorFilter: new ColorFilter.mode(
                        Colors.white.withOpacity(0.3), BlendMode.dstATop),
                    fit: BoxFit.cover)),
            child: GestureDetector(
              onTap: () => dismissKeyboard(context),
              child: Form(
                key: _formKey,
                child: Theme(
                  data: ThemeData(
                      fontFamily: 'Poppins',
                      accentColor: kPrimaryColor,
                      primarySwatch: Colors.orange,
                      colorScheme: ColorScheme.light(primary: kPrimaryColor)),
                  child: Stepper(
                      controlsBuilder: (BuildContext context,
                          {VoidCallback onStepContinue,
                          VoidCallback onStepCancel}) {
                        return Row();
                      },
                      type: StepperType.vertical,
                      physics: ScrollPhysics(),
                      currentStep: _currentStep,
                      onStepTapped: (step) => _tapped(step),
                      // onStepContinue: _continue,
                      steps: <Step>[
                        Step(
                            title: Text('Personal Info'),
                            content: Column(
                              children: <Widget>[
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: fnameController,
                                  validator: (value) =>
                                      value.isEmpty ? 'Required Field' : null,
                                  decoration:
                                      InputDecoration(labelText: 'Firstname'),
                                ),
                                TextFormField(
                                  controller: onameController,
                                  keyboardType: TextInputType.text,
                                  decoration:
                                      InputDecoration(labelText: 'Other names'),
                                ),
                                TextFormField(
                                  controller: lnameController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) =>
                                      value.isEmpty ? 'Required Field' : null,
                                  decoration:
                                      InputDecoration(labelText: 'Lastname'),
                                ),
                                DropdownButton(
                                  itemHeight: 70.0,
                                  value: _chosenValue,
                                  isExpanded: true,
                                  items: sex.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  hint: Text('Select Gender'),
                                  onChanged: (value) => {
                                    setState(() => _chosenValue = value),
                                    storeInLocalStorage('sex', value[0].toUpperCase(), 'str')
                                  },
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: 60,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(1900, 12, 31),
                                          maxTime: DateTime(2021, 12, 31),
                                          onConfirm: (date) {
                                        dismissKeyboard(context);
                                        final DateFormat formatter =
                                            DateFormat.yMMMMEEEEd();
                                        final String formattedDate =
                                            formatter.format(date);
                                        setState(() => _chosenDate =
                                            formattedDate.toString());
                                        storeInLocalStorage('dob',
                                            formattedDate.toString(), 'str');
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en);
                                    },
                                    child: Text(
                                      _chosenDate,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            isActive: _currentStep > 0,
                            state: _currentStep >= 0
                                ? StepState.complete
                                : StepState.disabled),
                        Step(
                            title: Text('Address'),
                            content: Column(
                              children: <Widget>[
                                DropdownButton(
                                  itemHeight: 70,
                                  value: _chosenRegion,
                                  isExpanded: true,
                                  items: regions.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  hint: Text('Select Region'),
                                  onChanged: (value) => {
                                    setState(() => _chosenRegion = value),
                                    storeInLocalStorage('region', value, 'str')
                                  },
                                ),
                                TextFormField(
                                  controller: districtController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) =>
                                      value.isEmpty ? 'Required Field' : null,
                                  decoration:
                                      InputDecoration(labelText: 'District'),
                                ),
                                TextFormField(
                                  controller: pcodeController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) =>
                                      value.isEmpty ? 'Required Field' : null,
                                  decoration:
                                      InputDecoration(labelText: 'Postcode'),
                                ),
                                DropdownButton(
                                  itemHeight: 70.0,
                                  value: _chosenIDType,
                                  isExpanded: true,
                                  items: id_types.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  hint: Text('Select ID Type'),
                                  onChanged: (value) => {
                                    setState(() => _chosenIDType = value),
                                    storeInLocalStorage(
                                        'id_type', _chosenIDType, 'str')
                                  },
                                ),
                                TextFormField(
                                  controller: idNumberController,
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  validator: (value) =>
                                      value.isEmpty ? 'Required Field' : null,
                                  decoration:
                                      InputDecoration(labelText: 'ID Number'),
                                )
                              ],
                            ),
                            isActive: _currentStep >= 0,
                            state: _currentStep >= 1
                                ? StepState.complete
                                : StepState.disabled),
                        Step(
                            title: Text('Contact'),
                            content: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) =>
                                      value.isEmpty ? 'Required Field' : null,
                                  decoration:
                                      InputDecoration(labelText: 'Email'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                TextFormField(
                                  controller: phoneController,
                                  decoration:
                                      InputDecoration(labelText: 'Phone'),
                                  keyboardType: TextInputType.phone,
                                  validator: (value) =>
                                      value.isEmpty ? 'Required Field' : null,
                                  onEditingComplete: () {
                                    setState(() => _buttonDone = true);
                                    dismissKeyboard(context);
                                  },
                                )
                              ],
                            ),
                            isActive: _currentStep >= 0,
                            state: _currentStep == 3
                                ? StepState.disabled
                                : StepState.complete)
                      ]),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () => _buttonDone ? _finished() : _continue(),
        child: _buttonDone
            ? !_loading ? Icon(Icons.done, color: Colors.white) : SpinKitRipple(
          color: Colors.white,
          size: 30.0,
        )
            : Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
      ),
    );
  }
}
