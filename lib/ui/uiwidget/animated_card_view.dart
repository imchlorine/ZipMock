import 'package:flutter/material.dart';
import 'package:zipmock/ui/share/shared_style.dart';

class AnimatedCardView extends StatefulWidget {
  final String url;
  final Function onPressed;
  final double height;
  final Color backgroundColor;
  final bool hasShadow;

  const AnimatedCardView({
    @required this.onPressed,
    this.url,
    this.height = 450,
    this.backgroundColor = darkBlue,
    this.hasShadow = false,
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
      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: InkWell(
        highlightColor: white,
        child: Container(
          height: widget.height,
          width: double.infinity,
          child: ScaleTransition(
              scale: animation,
              child: widget.url == null
                  ? Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: widget.hasShadow ? Colors.grey : white,
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 7), // changes position of shadow
                          ),
                        ],
                      ),
                    )
                  : Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: widget.backgroundColor,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: widget.hasShadow ? Colors.grey : white,
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 10), // changes position of shadow
                          )
                        ],
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
    super.dispose();
  }
}
