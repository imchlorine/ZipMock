import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zipmock/ui/settings/settings_view_model.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingsViewState();
  }
}

class _SettingsViewState extends State<SettingsView>
    with WidgetsBindingObserver {
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
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      onModelReady: (model) => model.setInitialData(),
      builder: (context, model, child) => Scaffold(
        ///backgroundColor: Colors.grey[100],
        backgroundColor: Colors.grey[100],
        body: Container(),
      ),
    );
  }
}
