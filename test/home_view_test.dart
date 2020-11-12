import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weatherapp/locator.dart';
import 'package:weatherapp/ui/views/home_view.dart';
import 'package:weatherapp/core/view_models/home_view_model.dart';

void main() {
  setupLocator();
  group("HomeView Test.", () {
    test("A value is set for property 'city'.", () async {
      final homeModel = locator<HomeViewModel>();
      const city = "Kathmandu";
      homeModel.onSearchChanged(city);
      expect(homeModel.city, city);
    });

    testWidgets("Widget should be found in the tree.",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeView()));

      final appbarWidget = find.byKey(Key('app-bar'));
      expect(appbarWidget, findsOneWidget);

      final cityTextFieldWidget = find.byKey(Key("text-form-field"));
      expect(cityTextFieldWidget, findsOneWidget);

      final fabWidget = find.byKey(Key("fab"));
      expect(fabWidget, findsOneWidget);
    });
  });
}
