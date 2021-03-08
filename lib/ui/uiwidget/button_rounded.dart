import 'package:flutter/material.dart';
import 'package:zipmock/ui/share/shared_style.dart';

/// A button that shows a busy indicator in place of title
class ButtonRounded extends StatefulWidget {
  final String title;
  final Function onPressed;
  final Color color;
  final Color titleColor;

  const ButtonRounded(
      {@required this.title,
      @required this.onPressed,
      this.color = darkBlue,
      this.titleColor = Colors.white});

  @override
  _ButtonRoundedState createState() => _ButtonRoundedState();
}

class _ButtonRoundedState extends State<ButtonRounded> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 20),
        color: widget.color,
        onPressed: widget.onPressed,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(widget.title,
              style: TextStyle(color: widget.titleColor, fontSize: 16)),
        ),
      ),
    );
  }
}
