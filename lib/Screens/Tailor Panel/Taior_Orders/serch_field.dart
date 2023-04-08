import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      // height: 660.0,
      decoration: BoxDecoration(
        // color: Colors.white.withOpacity(.8),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          SearchBarAnimation(
            textEditingController: TextEditingController(),
            isOriginalAnimation: true,
            enableKeyboardFocus: true,
            onExpansionComplete: () {
              debugPrint(
                  'do something just after searchbox is opened.');
            },
            onCollapseComplete: () {
              debugPrint(
                  'do something just after searchbox is closed.');
            },
            onPressButton: (isSearchBarOpens) {
              debugPrint(
                  'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
            },
            trailingWidget: const Icon(
              Icons.search,
              size: 20,
              color: Colors.black,
            ),
            secondaryButtonWidget: const Icon(
              Icons.close,
              size: 20,
              color: Colors.black,
            ),
            buttonWidget: const Icon(
              Icons.search,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
