import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zipmock/ui/share/shared_style.dart';
import 'package:zipmock/ui/uiwidget/animated_card_view.dart';
import 'package:zipmock/ui/uiwidget/app_bar.dart';
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

class _YourZipViewState extends State<YourZipView>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ScrollController _scrollController;

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
    return ViewModelBuilder<YourZipViewModel>.reactive(
      viewModelBuilder: () => YourZipViewModel(),
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
                title: "Your Zip",
                scrollController: _scrollController,
              ),
              ZipAppTitle(
                title: "Your Zip",
              ),
              SliverToBoxAdapter(
                child: _generateCard(),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 60, 15, 0),
                      child: Text(
                        "Lastest from Zip",
                        style: TextStyle(
                          fontSize: fontSize1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    AnimatedCardView(
                      height: 420,
                      onPressed: () {},
                      hasShadow: true,
                      url: 'assets/images/shop_everywhere.png',
                    ),
                    AnimatedCardView(
                      height: 420,
                      onPressed: () {},
                      hasShadow: true,
                      url: 'assets/images/pay_bpay.png',
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20),
              )
            ],
          ),
        ),
      ),
    );
  }

  _generateCard() {
    return Container(
      height: 160,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: grey1.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          'assets/images/card_balance.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
