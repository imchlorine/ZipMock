import 'package:flutter/material.dart';
import 'package:zipmock/ui/share/shared_style.dart';

/// A button that shows a busy indicator in place of title
class AnimatedCardView extends StatefulWidget {
  final String url;
  final Function onPressed;
  final double height;
  final Color backgroundColor;

  const AnimatedCardView({
    @required this.onPressed,
    this.url,
    this.height = 450,
    this.backgroundColor = darkBlue,
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
      padding: EdgeInsets.all(20),
      child: InkWell(
        highlightColor: white,
        child: Container(
          height: widget.height,
          child: ScaleTransition(
              scale: animation,
              child: widget.url == null
                  ? Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: widget.backgroundColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )
                  : Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: widget.backgroundColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        widget.url,
                        fit: BoxFit.cover,
                      ),
                    )),
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
