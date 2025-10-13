import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:test_prep_2/modules/search/w/w_search_hearder.dart';
import 'package:test_prep_2/utli/const/theme/app_theme.dart';

void main() {
  testWidgets('SearchHeader calls onChanged and onTapSearch', (tester) async {
    final txtController = TextEditingController();
    String? submittedQuery;
    String? changedQuery;
    await tester.pumpWidget(
      GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        home: Scaffold(
          body: SearchHearder(
            txtController: txtController,
            onTapSerch: (value) => submittedQuery = value,
            onChanged: (value) => changedQuery = value,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );

    // Type in text field
    await tester.enterText(find.byType(TextField), 'batman');
    await tester.pumpAndSettle();
    expect(changedQuery, 'batman');

    // Tap search button
    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle();
    expect(submittedQuery, 'batman');
  });
}
