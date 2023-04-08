import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPress;
  final Color colors;

  const ButtonWidget({Key? key,required this.title,required this.onPress,required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Container
          (
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          height: 45.h,
          width: 350.w,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18,color: Colors.white),
            ),
          ),
        ),
    );
  }
}
