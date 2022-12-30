//Packages
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

//Lib
import 'package:tatsujin_guild/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('e2eテスト', () {
    testWidgets('いいねする', (WidgetTester tester) async {
      await installApp(tester: tester);

      final Finder rankingText = find.text('昨日の人気のTATSUJINランキング');
      expect(rankingText, findsOneWidget);
      await tester.tap(rankingText);
      await tester.pumpAndSettle();
      final Finder timeLineTabText = find.text('タイムライン');
      expect(timeLineTabText, findsOneWidget);
      await tester.tap(timeLineTabText);
      await tester.pumpAndSettle();
      final Finder favoriteIcon = find.byIcon(Icons.favorite_border);
      expect(favoriteIcon, findsWidgets);
      await tester.tap(favoriteIcon.first);
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
      await tester.tap(favoriteIcon.first);
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.favorite_rounded), findsWidgets);
    });

    testWidgets('設定画面の編集', (WidgetTester tester) async {
      await installApp(tester: tester);

      await moveToTabPage(tester: tester, tabName: '設定');
      final Finder settingButton = find.widgetWithIcon(InkWell, Icons.settings);
      expect(settingButton, findsOneWidget);
      await tester.tap(settingButton);
      await tester.pumpAndSettle();
      final Finder introductionSection = find.ancestor(
        of: find.text('プロフィール'),
        matching: find.byType(
          InkWell,
        ),
      );
      expect(introductionSection, introductionSection);
      await tester.tap(introductionSection);
      await tester.pumpAndSettle();
      const String updateText = 'テストです';
      await tester.enterText(find.byType(TextFormField), updateText);
      final Finder saveButton = find.widgetWithText(TextButton, '保存');
      await tester.tap(saveButton);
      await tester.pumpAndSettle();
      final successSaveText = find.text('保存しました');
      expect(successSaveText, findsOneWidget);
      final Offset dialogPosition = tester.getCenter(successSaveText);
      await tester.tapAt(Offset(
        dialogPosition.dx,
        dialogPosition.dy - 200,
      ));
      await tester.pumpAndSettle();
      final Finder updateMessage = find.text(updateText);
      expect(updateMessage.hitTestable(), findsOneWidget);
    });
  });
}

Future<void> installApp({
  required WidgetTester tester,
}) async {
  app.main();
  await tester.pumpAndSettle();
}

Future<void> moveToTabPage({
  required WidgetTester tester,
  required String tabName,
}) async {
  final Finder tabButton = find.text(tabName);
  await tester.tap(tabButton);
  await tester.pumpAndSettle();
}
