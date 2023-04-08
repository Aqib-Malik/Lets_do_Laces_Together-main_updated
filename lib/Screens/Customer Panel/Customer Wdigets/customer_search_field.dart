import 'package:flutter/cupertino.dart';


class CustomerSearchField extends StatefulWidget {
  const CustomerSearchField({super.key});

  @override
  State<CustomerSearchField> createState() => _CustomerSearchFieldState();
}

class _CustomerSearchFieldState extends State<CustomerSearchField> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: 'initial text');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: CupertinoSearchTextField(
        // controller: textController,
        placeholder: 'Search',
      ),
    );
  }
}
