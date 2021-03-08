import 'package:zipmock/app/route_names.dart';
import 'package:zipmock/ui/share/base_model.dart';

class StartUpViewModel extends BaseModel {
  Future handleStartUpLogic() async {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      navigationService.navigateReplace(BottomNavBarRoute);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
