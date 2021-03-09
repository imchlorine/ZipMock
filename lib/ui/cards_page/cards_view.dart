import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zipmock/ui/cards_page/cards_view_model.dart';
import 'package:zipmock/ui/share/shared_style.dart';
import 'package:zipmock/ui/uiwidget/app_bar.dart';

class CardsView extends StatefulWidget {
  const CardsView({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardsViewState();
  }
}

class _CardsViewState extends State<CardsView>
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
    return ViewModelBuilder<CardsViewModel>.reactive(
      viewModelBuilder: () => CardsViewModel(),
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
                title: "Cards",
                scrollController: _scrollController,
                actions: [
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "learn more",
                      style: TextStyle(
                        fontSize: fontSize1,
                        color: lighyBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              ZipAppTitle(
                title: "Cards",
              ),
              SliverToBoxAdapter(
                child: _generateCard(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.link,
                        size: 16,
                        color: lighyBlue,
                      ),
                      Image.asset(
                        'assets/images/zip_pay.png',
                        height: 12,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "|",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "   \$1,000.00 avaliable",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _howToPay(),
              ),
              SliverToBoxAdapter(
                child: _cardSetting(),
              ),
              SliverToBoxAdapter(
                child: _shoppingOnline(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 50),
              )
            ],
          ),
        ),
      ),
    );
  }

  _generateCard() {
    return Container(
      height: 230,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: grey1,
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          'assets/images/zip_card_visa.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _howToPay() {
    return Container(
      height: 90,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: grey3,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: grey1.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How to pay anywhere with Zip",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Pay anywhere with just a tap of your phone.",
                    style: TextStyle(
                        fontSize: 13, color: darkBlue.withOpacity(0.5)),
                  ),
                  Text(
                    "Learn how",
                    style: TextStyle(fontSize: 13, color: lighyBlue),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/how_to_pay.png',
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  _cardSetting() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: grey3,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: grey1.withOpacity(0.5),
          ),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.lock_outline_rounded,
                color: lighyBlue,
              ),
              title: Text("Lock card"),
              trailing: CupertinoSwitch(
                value: false,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.update_rounded,
                color: lighyBlue,
              ),
              title: Text(
                "Manage PIN",
              ),
              subtitle: Text(
                "Set or update your card PIN",
                style: TextStyle(color: darkBlue.withOpacity(0.5)),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.casino,
                color: lighyBlue,
              ),
              title: Text("Add to Apple Watch"),
            ),
          ],
        ),
      ),
    );
  }

  _shoppingOnline() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: grey3,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: grey1.withOpacity(0.5),
          ),
        ),
        child: ListTile(
          leading: Icon(
            Icons.credit_card_rounded,
            color: lighyBlue,
          ),
          title: Text(
            "Shopping online?",
          ),
          subtitle: Text(
            "Use a single use card for extra security",
            style: TextStyle(color: darkBlue.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
