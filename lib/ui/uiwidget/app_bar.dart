import 'package:flutter/material.dart';
import 'package:zipmock/ui/share/shared_style.dart';

/// A button that shows a busy indicator in place of title
class ZipAppBar extends StatefulWidget {
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final bool pined;

  const ZipAppBar({
    this.title = "",
    this.titleColor = darkBlue,
    this.backgroundColor = white,
    this.pined = true,
  });

  @override
  _ZipAppBarState createState() => _ZipAppBarState();
}

class _ZipAppBarState extends State<ZipAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        widget.title,
        style: TextStyle(color: widget.titleColor),
      ),
      toolbarHeight: 45,
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      pinned: widget.pined,
    );
  }
}

class ZipAppTitle extends StatelessWidget {
  final String title;
  const ZipAppTitle({Key key, this.title = ""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: TextStyle(
              color: darkBlue, fontSize: 32, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
