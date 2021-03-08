import 'package:flutter/material.dart';
import 'package:zipmock/ui/bottom_nav/bottom_nav_view.dart';
import 'package:zipmock/ui/instore/instore_view.dart';

const String RootRoute = "/";
const String BottomNavBarRoute = "BottomNavBar";
const String InstoreViewRoute = "InstoreView";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case BottomNavBarRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: BottomNavView(),
      );

    case InstoreViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: InstoreView(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return CustomRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == BottomNavBarRoute) {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
