import 'package:zipmock/models/online_store_model.dart';
import 'package:zipmock/ui/share/base_model.dart';

class ShopViewModel extends BaseModel {
  List<OnlineStore> storeData;

  

  setInitialData() async {
    storeData = OnlineStoreData().storeData;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
