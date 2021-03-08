class OnlineStore {
  final String storeId;
  final String storeName;
  final String baseURL;
  final String storeLogo;

  OnlineStore({
    this.storeId,
    this.storeName,
    this.baseURL,
    this.storeLogo,
  });
}

class OnlineStoreData {
  List<OnlineStore> storeData = [
    OnlineStore(
      storeId: "1",
      storeName: "Officeworks",
      storeLogo:
          "https://static.ethicaljobs.com.au/media/large-x2/1569373097_tOi1l_.jpeg",
      baseURL: "",
    ),
    OnlineStore(
      storeId: "2",
      storeName: "JB HiFi",
      storeLogo:
          "https://res.cloudinary.com/scentre-group-au/image/fetch/c_pad,b_auto,w_1152,h_1152,f_auto/https://cam.scentregroup.io/m/28ad0512631c21b9",
      baseURL: "",
    ),
    OnlineStore(
      storeId: "3",
      storeName: "eBay",
      storeLogo:
          "https://ir.ebaystatic.com/cr/v/c1/ebay-logo-1-1200x630-margin.png",
      baseURL: "",
    ),
    OnlineStore(
      storeId: "4",
      storeName: "Woolworths",
      storeLogo:
          "https://i.pinimg.com/originals/32/db/5f/32db5fe4171fb92b34ecd758327a931b.png",
      baseURL: "",
    ),
    OnlineStore(
      storeId: "5",
      storeName: "Amazon",
      storeLogo:
          "https://upload.wikimedia.org/wikipedia/commons/d/de/Amazon_icon.png",
      baseURL: "",
    ),
    OnlineStore(
      storeId: "6",
      storeName: "Nike",
      storeLogo:
          "https://i.pinimg.com/originals/33/e6/3d/33e63d5adb0da6b303a83901c8e8463a.png",
      baseURL: "",
    ),
  ];
}
