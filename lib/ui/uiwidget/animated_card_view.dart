import 'package:flutter/material.dart';
import 'package:zipmock/ui/share/shared_style.dart';

/// A button that shows a busy indicator in place of title
class AnimatedCardView extends StatefulWidget {
  final String url;
  final Function onPressed;

  const AnimatedCardView({
    @required this.url,
    @required this.onPressed,
  });

  @override
  _AnimatedCardViewState createState() => _AnimatedCardViewState();
}

class _AnimatedCardViewState extends State<AnimatedCardView>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  bool isTap = false;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed && !isTap) {
              controller.reverse();
            }
          });
    animation = Tween<double>(begin: 1, end: 0.95).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      child: InkWell(
        highlightColor: white,
        child: Container(
          child: ScaleTransition(
            scale: animation,
            child: Image.asset(
              "assets/images/deals.png",
            ),
          ),
        ),
        onTap: () {
          controller.forward();
        },
        onTapCancel: () {
          controller.reverse();
          setState(() {
            isTap = false;
          });
        },
        onHighlightChanged: (value) {
          controller.reverse();
          if (value) {
            setState(() {
              isTap = true;
            });
          } else {
            isTap = false;
          }
        },
        onTapDown: (value) {
          controller.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    print("destory");
    super.dispose();
  }
}
