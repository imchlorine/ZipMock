import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zipmock/ui/cards/cards_view_model.dart';
class CardsView extends StatefulWidget {
  const CardsView({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardsViewState();
  }
}

class _CardsViewState extends State<CardsView> with WidgetsBindingObserver {
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
    return ViewModelBuilder<CardsViewModel>.reactive(
      viewModelBuilder: () => CardsViewModel(),
      onModelReady: (model) => model.setInitialData(),
      builder: (context, model, child) => Scaffold(
        ///backgroundColor: Colors.grey[100],
        backgroundColor: Colors.grey[100],
        body: Container(),
      ),
    );
  }
}
