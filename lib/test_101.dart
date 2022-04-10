import 'package:flutter/material.dart';
import 'package:clistApp/features/clist/presentation/widgets/alert_dialog_with_button.dart';

class Testin extends StatelessWidget {
  const Testin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: MaterialButton(
        color: Colors.amberAccent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialogwithButton(
                    dialogTitle: "An Error Occurred!",
                    width: 0.0,
                    height: 0.0,
                    errorMessage: "An error occurred while loading the data",
                    buttonLabel: "Try Again",
                    onPressed: () {
                      Navigator.pop(context);
                    });
              });
        },
      )),
    );
  }
}
