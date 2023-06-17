import 'package:asyou_app/application/store/app/app.dart';
import 'package:asyou_app/application/store/theme.dart';
import 'package:asyou_app/domain/utils/functions.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:asyou_app/infra/components/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'avatar.dart';

class MePop extends StatefulWidget {
  final String id;
  final String name;
  final bool online;
  final double avatarWidth;
  final Color? bg;
  final Color? color;

  const MePop(this.id, this.name, this.online, this.avatarWidth, {Key? key, this.bg, this.color}) : super(key: key);

  @override
  State<MePop> createState() => _MePopState();
}

class _MePopState extends State<MePop> {
  final BasePopupMenuController menuController = BasePopupMenuController();

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return BasePopupMenu(
      verticalMargin: 5.w,
      horizontalMargin: 0,
      showArrow: false,
      controller: menuController,
      position: PreferredPosition.bottomLeft,
      pressType: PressType.singleClick,
      child: UserAvatar(
        getUserShortId(widget.id),
        widget.online,
        widget.avatarWidth,
        bg: widget.bg,
        color: widget.color,
      ),
      menuBuilder: () => Container(
        width: 270.w,
        // height: 170.w,
        padding: EdgeInsets.only(top: 15.w, left: 15.w, right: 15.w),
        decoration: BoxDecoration(
          color: constTheme.centerChannelBg,
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          border: Border.all(color: constTheme.centerChannelColor.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w, top: 2.w, bottom: 2.w),
                    child: UserAvatar(
                      getUserShortId(widget.id),
                      true,
                      80.w,
                      bg: constTheme.centerChannelColor.withOpacity(0.1),
                      color: constTheme.centerChannelColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 90.w,
                  width: 145.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1.w),
                      Text(
                        getUserShortName(widget.name),
                        style: TextStyle(fontSize: 18.w, color: constTheme.centerChannelColor),
                      ),
                      Expanded(
                        child: Text(
                          widget.id,
                          style: TextStyle(fontSize: 12.w, height: 1.2, color: constTheme.centerChannelColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.w),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15.w),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: constTheme.centerChannelColor.withOpacity(0.05))),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '账户设置',
                        style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14.w,
                        color: constTheme.centerChannelColor,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15.w),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: constTheme.centerChannelColor.withOpacity(0.05))),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '实名认证',
                        style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14.w,
                        color: constTheme.centerChannelColor,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final im = context.read<AppCubit>();
                    menuController.hideMenu();
                    im.logout();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.w),
                    child: Row(
                      children: [
                        Text(
                          '退出登陆',
                          style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14.w,
                          color: constTheme.centerChannelColor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}