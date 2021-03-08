import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:stacked/stacked.dart';
import 'package:zipmock/ui/share/shared_style.dart';
import 'package:zipmock/ui/shop_page/shop_view_model.dart';
import 'package:zipmock/ui/uiwidget/animated_card_view.dart';
import 'package:zipmock/ui/uiwidget/app_bar.dart';

class ShopView extends StatefulWidget {
  const ShopView({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShopViewState();
  }
}

class _ShopViewState extends State<ShopView>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ViewModelBuilder<ShopViewModel>.reactive(
      viewModelBuilder: () => ShopViewModel(),
      onModelReady: (model) => model.setInitialData(),
      builder: (context, model, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: white,
          body: SafeArea(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                ZipAppBar(
                  pined: false,
                ),
                ZipAppTitle(
                  title: "Shop",
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    child: PreferredSize(
                      preferredSize: Size.fromHeight(70.0),
                      child: _searchWidget(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _generateCard(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 30),
                ),
                SliverToBoxAdapter(
                  child: _trendingStore(model),
                ),
                SliverToBoxAdapter(
                  child: _iWantTo(model),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 30),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        children: [
                          AnimatedCardView(
                            height: 400,
                            onPressed: () {},
                            url: model.bannerData[index].bannerBgImage,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                    childCount: model.bannerData.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: AnimatedCardView(
                    height: 150,
                    onPressed: () {},
                    url: "assets/images/deals.png",
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 50),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _searchWidget() {
    return Container(
      height: 70,
      color: white,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: InkWell(
          onTap: () {},
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                color: grey1.withOpacity(0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.search,
                  size: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Search for anything...",
                  style: TextStyle(
                      color: darkBlue.withOpacity(0.5), fontSize: fontSize1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _generateCard() {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: grey1.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: grey1.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: grey1.withOpacity(0.5),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  'assets/images/zip_visa.png',
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Generate a single-use card",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Shop everywhere online with Zip.",
                    style: TextStyle(
                      color: darkBlue.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _trendingStore(ShopViewModel model) {
    return Container(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: Text(
                "Trending stores",
                style: TextStyle(
                  fontSize: fontSize1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: model.storeData.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          border: Border.all(
                            color: grey1.withOpacity(0.5),
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl: model.storeData[index].storeLogo,
                          height: 70,
                          width: 70,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        model.storeData[index].storeName,
                        style: TextStyle(
                            color: darkBlue.withOpacity(0.7), fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  _iWantTo(ShopViewModel model) {
    return Container(
      height: 215,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
            child: Text(
              "I want to ${EmojiParser().get("thinking_face").code}",
              style: TextStyle(
                fontSize: fontSize1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                _iWantToCard(
                    "Buy a \nGift Card", "assets/images/giftcard.png", () {}),
                _iWantToCard("Make Extra Repayments",
                    "assets/images/pay_extra.png", () {}),
                _iWantToCard("Pay a Bill", "assets/images/bpay.png", () {}),
                _iWantToCard(
                    "Pay my rego", "assets/images/giftcard.png", () {}),
                _iWantToCard(
                    "Buy Groceries", "assets/images/giftcard.png", () {}),
                _iWantToCard(
                    "Find stores near me", "assets/images/giftcard.png", () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _iWantToCard(String title, String image, Function onclick) {
    return Container(
        padding: EdgeInsets.only(right: 15),
        child: InkWell(
          onTap: onclick,
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
