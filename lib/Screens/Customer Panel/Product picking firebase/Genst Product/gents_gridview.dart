import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../Tailor Panel/Model/controller/controller.dart';
import '../Ledies Product/show_dailog.dart';

class GentsGridViewShowingCustomerPanel extends StatefulWidget {
  const GentsGridViewShowingCustomerPanel({super.key});

  @override
  State<GentsGridViewShowingCustomerPanel> createState() =>
      _LadiesGridViewState();
}

final _GentsCardController = GentsCardController();

class _LadiesGridViewState extends State<GentsGridViewShowingCustomerPanel> {
  @override
  Widget build(BuildContext context) {
    void _showMyDialog(BuildContext context, String text, des, text1, img) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog(
            text: text.toString(),
            img: img.toString(),
            price: text1.toString(),
            des: des.toString(),
            onOkPressed: () {
              // Do something when OK button is pressed
              Navigator.of(context).pop();
            },
          );
        },
      );
    }

    return SizedBox(
      height: _GentsCardController.modelData.length * 100.0,
      child: GridView.count(
          shrinkWrap: false,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children:
              List.generate(_GentsCardController.modelData.length, (index) {
            return Expanded(
              child: InkWell(
                onTap: () {
                  _showMyDialog(
                    context,
                    _GentsCardController.modelData[index].title.toString(),
                    _GentsCardController.modelData[index].description
                        .toString(),
                    _GentsCardController.modelData[index].price.toString(),
                    _GentsCardController.modelData[index].image.toString(),
                  );
                },
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 20,
                  child: Stack(
                    children: <Widget>[
                      ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: Image.asset(
                            _GentsCardController.modelData[index].image
                                .toString(),
                            fit: BoxFit.fill,
                          )),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                            child: Container(
                              height: 30.0,
                              decoration: BoxDecoration(
                                  color: AppColors.backGroundColor
                                      .withOpacity(0.5)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    _GentsCardController.modelData[index].title
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
