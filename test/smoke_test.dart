import 'package:flutter_test/flutter_test.dart';

import 'package:sample_flutter_app/main.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());
  });
}
