import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:zipmock/app/locator.dart';
import 'package:zipmock/models/dialog_model.dart';
import 'package:zipmock/services/dialog_service.dart';
import 'package:zipmock/ui/share/shared_style.dart';
import 'package:zipmock/ui/uiwidget/button_rounded.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(DialogRequest request) {
    var isConfirmationDialog = request.cancelTitle != null;

    showCupertinoModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Material(
          child: CupertinoPageScaffold(
            backgroundColor: darkBlue,
            child: SafeArea(
              bottom: false,
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: Text(
                      request.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: ButtonRounded(
                        color: Colors.white,
                        title: request.buttonTitle,
                        titleColor: darkBlue,
                        onPressed: () {
                          request.onButtonClick();
                          _dialogService
                              .dialogComplete(DialogResponse(confirmed: true));
                        },
                      ),
                    ),
                  ),
                  if (isConfirmationDialog)
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: ButtonRounded(
                          color: white,
                          title: request.cancelTitle,
                          titleColor: darkBlue,
                          onPressed: () {
                            _dialogService.dialogComplete(
                                DialogResponse(confirmed: false));
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
