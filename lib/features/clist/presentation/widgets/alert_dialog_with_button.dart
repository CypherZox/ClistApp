import 'package:flutter/material.dart';

import 'basic_button_alert.dart';

class AlertDialogwithButton extends StatelessWidget {
  const AlertDialogwithButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.errorMessage,
      required this.buttonLabel,
      this.dialogTitle,
      required this.onPressed})
      : super(key: key);

  final double width;
  final double height;
  final String errorMessage;
  final String? dialogTitle;

  final String buttonLabel;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Container(
          width: 215,
          height: 215,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(36)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 26,
              ),
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    dialogTitle != null ? dialogTitle! : "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Poppins-SemiBold',
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    maxLines: 4,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    maxLines: 7,
                  ),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: BasicButtonAlert(
                    height: height,
                    width: width,
                    label: buttonLabel,
                    onPressed: () {
                      onPressed();
                    },
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
