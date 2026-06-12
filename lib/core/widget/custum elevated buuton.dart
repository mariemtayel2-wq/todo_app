import 'package:flutter/material.dart';

class Custumelevatedbutton extends StatelessWidget {
  Custumelevatedbutton({
    super.key,
    required this.child,
    this.backgroundcolor,
    required this.onPressed,
    this.borderside,
  });

  Widget child;
  Color? backgroundcolor;
  VoidCallback onPressed;
  Color? borderside;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height * .07),
        backgroundColor: backgroundcolor,
        padding: EdgeInsets.all(height * .01),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(width: 1, color: borderside ?? Colors.transparent),
        ),
      ),

      onPressed: () {
        onPressed();
      },
      child: child,
    );
  }
}
