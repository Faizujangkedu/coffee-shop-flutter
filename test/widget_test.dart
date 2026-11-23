// test/widget_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:coffee_shop_app/main.dart';

void main() {
  testWidgets('Coffee Shop app tampil', (WidgetTester tester) async {
    await tester.pumpWidget(const CoffeeShopApp());

    expect(find.text('COFFEE SHOP'), findsOneWidget);
    expect(find.text('Our Coffee Menu'), findsOneWidget);
  });
}
