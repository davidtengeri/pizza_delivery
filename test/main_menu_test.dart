import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_delivery/l10n/pizza_delivery_localizations.dart';
import 'package:pizza_delivery/main_menu.dart';
import 'package:pizza_delivery/menu_button.dart';

void main() {
  group('MainMenu', () {
    testWidgets('has the main menu elements', (WidgetTester tester) async {
      await tester.pumpWidget(Localizations(
        locale: Locale('en', 'EN'),
        delegates: [
          PizzaDeliveryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        child: MainMenu(),
      ));
      await tester.pumpAndSettle();

      final orderTextFinder = find.widgetWithText(MenuButton, 'Order');

      expect(orderTextFinder, findsOneWidget);
    });
  });
}
