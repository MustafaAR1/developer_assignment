import 'dart:ui';

import 'package:developer_assignment/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class UICommonCard extends StatelessWidget {
  final Widget child;
  const UICommonCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                margin: const EdgeInsets.only(
                    top: 100, left: 32, right: 32, bottom: 32),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: child),
                ),
              ),
              Positioned(
                  top: 50,
                  left: 20,
                  child: Image.asset(AssetConstants.cloud,
                      width: 100, height: 100)),
            ],
          ),
        ),
      ],
    );
  }
}