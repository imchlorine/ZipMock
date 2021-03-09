import 'package:flutter/material.dart';
import 'package:zipmock/ui/share/shared_style.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData leading;
  final IconData trailing;

  const CustomListTile(
      {Key key,
      @required this.title,
      this.subTitle,
      @required this.leading,
      this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        subTitle == null
            ? ListTile(
                leading: Icon(leading),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                title: Text(title),
                trailing: Icon(trailing),
              )
            : ListTile(
                leading: Icon(leading),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                title: Text(title),
                subtitle: Text(
                  subTitle,
                  style: TextStyle(color: darkBlue.withOpacity(0.5)),
                ),
                trailing: Icon(trailing),
              ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Divider(
            color: darkBlue.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
