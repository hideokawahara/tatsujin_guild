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
      app.main();
      await tester.pumpAndSettle();

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
  });
}
