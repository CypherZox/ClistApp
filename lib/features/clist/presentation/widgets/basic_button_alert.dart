import 'package:flutter/material.dart';

import '../../../../config/constants/app_constants.dart';

class BasicButtonAlert extends StatelessWidget {
  const BasicButtonAlert(
      {required this.width,
      required this.label,
      required this.height,
      required this.onPressed});
  final String label;
  final double width;
  final double height;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            primary: AppColors.secondary.withOpacity(0.9), // background
            onPrimary: Colors.white, // foreground
          ),
          onPressed: () {
            onPressed();
          },
          child: SizedBox(
            height: 40,
            width: 113,
            child: Center(
              child: Text(label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'OpenSans-SemiBold',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
            ),
          ),
        ),
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 18,
            color: Color(0xffEBEBEB),
            offset: Offset(5, 6),
          )
        ]),
      ),
    );
  }
}
