import 'package:flutter/material.dart';
import 'package:zipmock/app/route_names.dart';
import 'package:zipmock/ui/cards/cards_view.dart';
import 'package:zipmock/ui/settings/settings_view.dart';
import 'package:zipmock/ui/share/base_model.dart';
import 'package:zipmock/ui/shop/shop_view.dart';
import 'package:zipmock/ui/your_zip/your_zip_view.dart';

class BottomNavViewModel extends BaseModel {
  PageController pageController = PageController();
  List<Widget> pageList = List<Widget>();
  BuildContext context;
  int initialIndex = 0;

  BottomNavViewModel(this.context);

  setInitialData() async {
    pageList.add(ShopView());
    pageList.add(YourZipView());
    pageList.add(CardsView());
    pageList.add(SettingsView());
  }

  void onBottomIconPressed(int index) {
    pageController.jumpToPage(index);

    notifyListeners();
  }

  void onCenterPressed(int index) {
    navigationService.navigateTo(InstoreViewRoute);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
