import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:zipmock/ui/instore_page/instore_view_model.dart';
import 'package:zipmock/ui/share/shared_style.dart';

class InstoreView extends StatefulWidget {
  const InstoreView({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InstoreViewState();
  }
}

class _InstoreViewState extends State<InstoreView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InstoreViewModel>.reactive(
      viewModelBuilder: () => InstoreViewModel(),
      onModelReady: (model) => model.setInitialData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: white,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: CupertinoButton(
            child: Text(
              "Close",
              style: TextStyle(color: lighyBlue, fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          leadingWidth: 80,
          actions: [
            CupertinoButton(
              child: Text(
                "Need Help?",
                style: TextStyle(color: darkBlue.withOpacity(0.5)),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              "assets/images/instore.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
