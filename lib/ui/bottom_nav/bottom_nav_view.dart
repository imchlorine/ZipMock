import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zipmock/ui/bottom_nav/bottom_nav_view_model.dart';
import 'package:zipmock/ui/bottom_nav/bottom_navigation_bar.dart';
import 'package:zipmock/ui/share/shared_style.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({Key key}) : super(key: key);

  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavViewModel>.reactive(
        viewModelBuilder: () => BottomNavViewModel(context),
        onModelReady: (model) => model.setInitialData(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.grey.shade300,
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                // 禁止滑动
                controller: model.pageController,
                // onPageChanged: (int index) => model.currentPage = index,
                children: model.pageList,
              ),
              bottomNavigationBar: CustomBottomNavigationBar(
                color: darkBlue,
                selectedColor: lighyBlue,
                initialIndex: model.initialIndex,
                onTabSelected: model.onBottomIconPressed,
                centerItem: CustomBottomAppBarItem(
                    iconData: Icons.qr_code_scanner_sharp, text: 'In-store'),
                centerOnpress: () {
                  print("In store");
                },
                items: [
                  CustomBottomAppBarItem(iconData: Icons.shopping_bag, text: 'Shop'),
                  CustomBottomAppBarItem(
                      iconData: Icons.explore, text: 'Your zip'),
                  CustomBottomAppBarItem(
                      iconData: Icons.credit_card, text: 'Cards'),
                  CustomBottomAppBarItem(
                      iconData: Icons.settings, text: 'Settings'),
                ],
              ),
            ));
  }
}
