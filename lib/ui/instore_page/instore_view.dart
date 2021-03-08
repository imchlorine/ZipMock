import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zipmock/ui/instore_page/instore_view_model.dart';
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
        ///backgroundColor: Colors.grey[100],
        backgroundColor: Colors.grey[100],
        body: Container(),
      ),
    );
  }
}
