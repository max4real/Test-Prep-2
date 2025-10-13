import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

int value = 0;

int increment() => value++;
int decrement() => value--;

// Unit test (individual class and function)
int add(int a, int b) {
  return a + b;
}

void main1() {
  test('add two number correctly', () {
    expect(add(10, 10), 20);
  });

  test('description', () {
    expect(add(10, 0), 10);
  });
}

// Widget test (test out widget without launching the app)
class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text(
              'Hello World',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Click me')),
          ],
        ),
      ),
    );
  }
}

void main() {
  testWidgets('Check if button shows text', (tester) async {
    await tester.pumpWidget(TestWidget());

    // Verify button text
    expect(find.text('Click me'), findsOneWidget);
  });

  testWidgets('check if hello world exit', (widgetTester) async {
    await widgetTester.pumpWidget(TestWidget());

    expect(find.text('Hello World'), findsOneWidget);
  });
}
