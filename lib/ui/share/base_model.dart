import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:zipmock/app/locator.dart';
import 'package:zipmock/services/api_service.dart';
import 'package:zipmock/services/dialog_service.dart';
import 'package:zipmock/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class BaseModel extends BaseViewModel {
  final APIService _apiService = locator<APIService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  bool _busy = false;
  bool get isBusy => _busy;
  APIService get apiService => _apiService;
  NavigationService get navigationService => _navigationService;
  DialogService get dialogService => _dialogService;

  void setBusy(bool value) {
    _busy = value;

    if (value) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
    }
    notifyListeners();
  }

  void setBusyWithoutLoading(bool value) {
    _busy = value;
    notifyListeners();
  }
}
