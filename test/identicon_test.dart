import 'package:dtim/router.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dtim/domain/utils/identicon.dart';

void main() {
  testWidgets("test user_avatar.dart", (WidgetTester tester) async {
    initScreen(1200);
    const imgbg = Colors.red;
    final img = Identicon(fg: [imgbg.red, imgbg.green, imgbg.blue]).generate("test", scale: 1);
    await tester.pumpWidget(
      MaterialApp(
        theme: getDefaultTheme(),
        navigatorKey: rootNavigatorKey,
        home: Image.memory(
          img,
          width: 80,
          height: 80,
          fit: BoxFit.contain,
        ),
      ),
    );
    await tester.pumpAndSettle();
  });
}
