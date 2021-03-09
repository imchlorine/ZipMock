import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zipmock/ui/settings_page/settings_view_model.dart';
import 'package:zipmock/ui/share/shared_style.dart';
import 'package:zipmock/ui/uiwidget/app_bar.dart';
import 'package:zipmock/ui/uiwidget/custom_list_tile.dart';

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
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  ScrollController _scrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      onModelReady: (model) => model.setInitialData(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            slivers: [
              ZipAppBar(
                pined: true,
                title: "Hi Ricky",
                scrollController: _scrollController,
              ),
              ZipAppTitle(
                title: "Hi Ricky",
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 60),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "ACCOUNT",
                        style: TextStyle(
                          color: darkBlue.withOpacity(0.5),
                        ),
                      ),
                    ),
                    CustomListTile(
                      leading: Icons.credit_card,
                      title: "Manage Zip Pay",
                      trailing: Icons.keyboard_arrow_right,
                    ),
                    CustomListTile(
                      leading: Icons.person,
                      title: "Personal details",
                      trailing: Icons.keyboard_arrow_right,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 50),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "SETTING",
                        style: TextStyle(
                          color: darkBlue.withOpacity(0.5),
                        ),
                      ),
                    ),
                    CustomListTile(
                      leading: Icons.settings,
                      title: "App settings",
                      trailing: Icons.keyboard_arrow_right,
                    ),
                    CustomListTile(
                      leading: Icons.notifications,
                      title: "Notifications",
                      trailing: Icons.keyboard_arrow_right,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 50),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "HELP",
                        style: TextStyle(
                          color: darkBlue.withOpacity(0.5),
                        ),
                      ),
                    ),
                    CustomListTile(
                      leading: Icons.refresh_sharp,
                      title: "About payment & sechdule",
                      subTitle: "How to change your payment schedule",
                    ),
                    CustomListTile(
                      leading: Icons.help_center,
                      title: "How to return a purchase",
                      subTitle: "How to return a purchase made with Zip",
                    ),
                    CustomListTile(
                      leading: Icons.question_answer,
                      title: "Help Centre",
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
