import 'package:flutter/material.dart';
import 'package:zipmock/ui/share/shared_style.dart';

/// A button that shows a busy indicator in place of title
class ZipAppBar extends StatefulWidget {
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final bool pined;
  final ScrollController scrollController;

  const ZipAppBar({
    this.title = "",
    this.titleColor = darkBlue,
    this.backgroundColor = white,
    this.pined = true,
    this.scrollController,
  });

  @override
  _ZipAppBarState createState() => _ZipAppBarState();
}

class _ZipAppBarState extends State<ZipAppBar> {
  ScrollController _scrollController;
  bool showTitle = false;
  @override
  void initState() {
    super.initState();
    if (widget.scrollController != null) {
      _scrollController = widget.scrollController;
      _scrollController.addListener(() {
        if (_scrollController.position.pixels > 40) {
          setState(() {
            showTitle = true;
          });
        } else {
          setState(() {
            showTitle = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        showTitle ? widget.title : "",
        style: TextStyle(
            color: widget.titleColor,
            fontSize: 16,
            fontWeight: FontWeight.bold),
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
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
