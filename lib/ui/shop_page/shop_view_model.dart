import 'package:zipmock/models/online_store_model.dart';
import 'package:zipmock/models/shop_banner_model.dart';
import 'package:zipmock/ui/share/base_model.dart';

class ShopViewModel extends BaseModel {
  List<OnlineStore> storeData;
  List<ShopBanner> bannerData;

  setInitialData() async {
    storeData = OnlineStoreData().storeData;
    bannerData = ShopBannerData().bannerData;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
