// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:cmovil_v4/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App arranca y renderiza SplashView', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Verifica que se renderiza un Scaffold (estructura base de SplashView)
    expect(find.byType(Scaffold), findsWidgets);

    // Verifica que aparece el branding de CMovil V4
    expect(find.text('CMovil V4'), findsOneWidget);

    // Verifica que hay un indicador de carga (spinner de Splash)
    expect(find.byType(CircularProgressIndicator), findsWidgets);
  });
}
