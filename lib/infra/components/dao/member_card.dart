import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';

import 'package:dtim/application/store/theme.dart';
import '../avatar.dart';
import 'text.dart';

class MemberCard extends StatelessWidget {
  final String? label;
  const MemberCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      width: 250.w,
      constraints: BoxConstraints(minWidth: isPc() ? 140.w : 100.w, maxWidth: double.maxFinite),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        color: constTheme.centerChannelColor.withOpacity(0.05),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseAvatar(
            label ?? "",
            true,
            50.w,
            color: constTheme.centerChannelColor,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: PrimaryText(
              text: label!,
              size: 12.w,
            ),
          ),
        ],
      ),
    );
  }
}
