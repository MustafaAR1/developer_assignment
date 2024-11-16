import 'package:developer_assignment/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class UiScaffold extends StatelessWidget {
  final Widget body;
  const UiScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetConstants.background),
            fit: BoxFit.cover,
          ),
        ),
        child: body,
      ),
    );
  }
}
