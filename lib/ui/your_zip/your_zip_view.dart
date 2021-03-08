import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zipmock/ui/your_zip/your_zip_view_model.dart';

class YourZipView extends StatefulWidget {
  const YourZipView({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _YourZipViewState();
  }
}

class _YourZipViewState extends State<YourZipView> with WidgetsBindingObserver {
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
    return ViewModelBuilder<YourZipViewModel>.reactive(
      viewModelBuilder: () => YourZipViewModel(),
      onModelReady: (model) => model.setInitialData(),
      builder: (context, model, child) => Scaffold(
        ///backgroundColor: Colors.grey[100],
        backgroundColor: Colors.grey[100],
        body: Container(),
      ),
    );
  }
}
