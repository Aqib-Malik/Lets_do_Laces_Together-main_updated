import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

class CategoriesCard extends StatefulWidget {
  Image img;
  String title;
  Color? color;
  CategoriesCard({Key? key, required this.img, required this.title, this.color})
      : super(key: key);

  @override
  State<CategoriesCard> createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 80.w,
      child: Card(
        color: widget.color,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child: Stack(
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: widget.img,
            ),
          ],
        ),
      ),
    );
  }
}
