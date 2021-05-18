import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  int _currentStep = 0;
  dynamic selectedValue = {};

  final _formKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<FormState>();

  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final onameController = TextEditingController();
  final pcodeController = TextEditingController();
  final districtController = TextEditingController();

  _tapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  _continue() {
    setState(() {
      _currentStep += 1;
    });
  }

  _validator(value){
    if (value.isEmpty){
      return 'Required field';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Registration',
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false),
      body: Stepper(
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Row();
          },
          type: StepperType.vertical,
          physics: ScrollPhysics(),
          currentStep: _currentStep,
          onStepTapped: (step) => _tapped(step),
          steps: <Step>[
            Step(
                title: Text('Account'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) => _validator(value),
                        decoration: InputDecoration(labelText: 'Firstname'),
                        controller: fnameController,
                      ),
                      TextFormField(
                        validator: (value) => _validator(value),
                        decoration: InputDecoration(labelText: 'Other Name'),
                        controller: onameController,
                      ),
                      TextFormField(
                        validator: (value) => _validator(value),
                        controller: lnameController,
                        onEditingComplete: _continue,
                        decoration: InputDecoration(labelText: 'Lastname'),
                      ),
                    ],
                  ),
                ),
                isActive: _currentStep >= 0,
                state: _currentStep >= 0
                    ? StepState.complete
                    : StepState.disabled),
            Step(
              title: new Text('Address'),
              content: Form(
                key: _addressFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: districtController,
                      decoration: InputDecoration(labelText: 'District'),
                    ),
                    TextFormField(
                      controller: pcodeController,
                      decoration: InputDecoration(labelText: 'Post Code'),
                    ),
                  ],
                ),
              ),
              isActive: _currentStep >= 0,
              state:
                  _currentStep >= 1 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: new Text('Mobile Number'),
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Mobile Number'),
                  ),
                ],
              ),
              isActive: _currentStep >= 0,
              state:
                  _currentStep >= 2 ? StepState.complete : StepState.disabled,
            ),
          ]),
    );
  }
}
