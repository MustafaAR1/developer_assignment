import 'package:developer_assignment/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class UiScaffold extends StatelessWidget {
  final Widget body;
  final bool showBackground;
  final PreferredSizeWidget? appBar;
  const UiScaffold(
      {super.key, required this.body, this.showBackground = false, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: showBackground
                ? const DecorationImage(
                    image: AssetImage(AssetConstants.background),
                    fit: BoxFit.cover,
                  )
                : null),
        child: body,
      ),
    );
  }
}
