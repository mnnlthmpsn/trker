import 'package:flutter/material.dart';
import 'package:trker/screens/registration/RegisterScreen.dart';
import 'package:trker/utils/helpers.dart';
import 'package:trker/utils/size_config.dart';

class KTextField extends StatefulWidget {

  final String labelText;
  final String actionText;
  final Widget redirectPage;
  final IconData actionIcon;
  final bool skipValidation;

  KTextField({Key key, this.labelText, this.redirectPage, this.actionIcon, this.actionText, this.skipValidation = false}) : super(key: key);

  @override
  _KTextFieldState createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  var textController = TextEditingController();
  bool show = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.skipValidation == true){
      setState(() {
        show = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                child: TextFormField(
                  onEditingComplete: () {
                    dismissKeyboard(context);
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        show = true;
                      });
                    }
                  },
                  validator: (value) {
                    if (show == false && value.isEmpty) {
                      return 'This is a required field. Enter ${widget.labelText}';
                    }
                    return null;
                  },
                  controller: textController,
                  autofocus: false,
                  cursorColor: Colors.grey,
                  cursorWidth: .5,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: show ? Colors.green : Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: show ? Colors.green : Colors.grey),
                      ),
                      labelText: widget.labelText,
                      labelStyle:
                      TextStyle(color: show ? Colors.green : Colors.grey),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: SizeConfig.blockSizeHorizontal * 100,
                height: SizeConfig.blockSizeVertical * 9,
                child: show ? ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.actionText),
                      Icon(widget.actionIcon)
                    ],
                  ),
                  onPressed: (){
                    dismissKeyboard(context);
                    newPage(context, RegisterScreen(screen: widget.redirectPage,));
                  },
                ) : ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.actionText),
                      Icon(widget.actionIcon),
                    ],
                  ),
                  onPressed: null
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
