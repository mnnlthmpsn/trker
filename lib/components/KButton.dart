import 'package:flutter/material.dart';
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
              ? () {
                  dismissKeyboard(context);
                  newPage(context, widget.redirectPage);
                }
              : null,
        ),
      ),
    );
  }
}
