import 'package:flutter/material.dart';
import 'package:trker/utils/helpers.dart';
import 'package:trker/utils/constants.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  int _currentStep = 0;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _buttonDone = false;

  String _chosenValue = 'Male';
  String _chosenRegion = 'Greater Accra';

  var sex = ['Male', 'Female'];
  var regions = ['Greater Accra', 'Central Region'];

  _tapped(int step) => setState(() => _currentStep = step);

  void _continue() => _currentStep >= 0 && _currentStep < 2
      ? setState(() => _currentStep += 1)
      : null;

  _finished() {
    if (_formKey.currentState.validate() == false) {
      // change icon from finish
      setState(() {
        _buttonDone = false;
      });
    } else {
      print('validated successfully continue now');
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Registration',
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: Form(
          key: _formKey,
          child: Stepper(
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
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
                          onEditingComplete: () => node.nextFocus(),
                          validator: (value) =>
                              value.isEmpty ? 'Required Field' : null,
                          decoration: InputDecoration(labelText: 'Firstname'),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onEditingComplete: () => node.nextFocus(),
                          decoration: InputDecoration(labelText: 'Other names'),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onEditingComplete: () => node.nextFocus(),
                          validator: (value) =>
                              value.isEmpty ? 'Required Field' : null,
                          decoration: InputDecoration(labelText: 'Lastname'),
                        ),
                        DropdownButton(
                          itemHeight: 70.0,
                          value: _chosenValue,
                          isExpanded: true,
                          items: sex.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value)
                            );
                          }).toList(),
                          hint: Text('Sex'),
                          onChanged: (value) => setState(() => _chosenValue = value),
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Date of Birth'),
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
                          items: regions.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value)
                            );
                          }).toList(),
                          hint: Text('Region'),
                          onChanged: (value) => setState(() => _chosenRegion = value),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onEditingComplete: () => node.nextFocus(),
                          validator: (value) =>
                              value.isEmpty ? 'Required Field' : null,
                          decoration: InputDecoration(labelText: 'District'),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onEditingComplete: () => node.nextFocus(),
                          validator: (value) =>
                              value.isEmpty ? 'Required Field' : null,
                          decoration: InputDecoration(labelText: 'Postcode'),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'ID Type'),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          onEditingComplete: () => node.nextFocus(),
                          validator: (value) =>
                              value.isEmpty ? 'Required Field' : null,
                          decoration: InputDecoration(labelText: 'ID Number'),
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
                          onEditingComplete: () => node.nextFocus(),
                          validator: (value) =>
                              value.isEmpty ? 'Required Field' : null,
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Phone'),
                          keyboardType: TextInputType.phone,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _buttonDone ? _finished() : _continue(),
        child: _buttonDone
            ? Icon(Icons.done, color: kPrimaryColor)
            : Icon(
                Icons.keyboard_arrow_down,
                color: kPrimaryColor,
              ),
      ),
    );
  }
}
