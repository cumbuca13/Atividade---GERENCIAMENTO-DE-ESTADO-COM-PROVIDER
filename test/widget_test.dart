import 'package:flutter_test/flutter_test.dart';
import 'package:gametracker/main.dart';

void main() {
  testWidgets('GameTracker inicia corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const GameTrackerApp());

    expect(find.text('GameTracker'), findsOneWidget);
  });
}