import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:zipmock/app/global.dart';
import 'package:zipmock/app/locator.dart';
import 'package:zipmock/app/route_names.dart';
import 'package:zipmock/managers/dialog_manager.dart';
import 'package:zipmock/ui/share/shared_style.dart';
import 'package:zipmock/ui/start/startup_view.dart';
import 'package:zipmock/services/dialog_service.dart';
import 'package:zipmock/services/navigation_service.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(MyApp()));

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.black.withOpacity(0.5)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      child: MaterialApp(
        builder: EasyLoading.init(
          builder: (context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              child: Navigator(
                key: locator<DialogService>().dialogNavigationKey,
                onGenerateRoute: (settings) => CustomRoute(
                    builder: (context) => DialogManager(child: child),
                    settings: settings),
              ),
              data: data.copyWith(textScaleFactor: 1.0),
            );
          },
        ),
        navigatorKey: locator<NavigationService>().navigationKey,
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Rubik',
              displayColor: darkBlue,
              bodyColor: darkBlue,
              decorationColor: darkBlue),
        ),
        home: StartUpView(),
        onGenerateRoute: generateRoute,
      ),
      data: MediaQueryData(textScaleFactor: 1.0),
    );
  }
}
