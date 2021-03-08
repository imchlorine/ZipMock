import 'package:flutter/foundation.dart';

class DialogRequest {
  final String title;
  final String description;
  final String buttonTitle;
  final String cancelTitle;
  final Function onButtonClick;

  DialogRequest({
    @required this.title,
    @required this.description,
    @required this.buttonTitle,
    this.cancelTitle,
    @required this.onButtonClick,
  });
}

class DialogResponse {
  final bool confirmed;
  DialogResponse({
    this.confirmed,
  });
}
