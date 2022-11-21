// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'config.dart';
import 'package:my_movie_app/main.dart'as app;

// This is an example integration test using Patrol. Use it as a base to
// create your own Patrol-powered test.
//
// To run it, you have to use `patrol drive` instead of `flutter test`.

void main() {
  patrolTest(
    'counter state is the same after going to home and switching apps And sing up',
    config: patrolConfig,
    nativeAutomation: true,
    ($) async {
      // Replace with your own app widget.
      await $.pumpWidgetAndSettle(const app.MyApp());
      await $.native.pressHome();
      await $.native.pressDoubleRecentApps();
      await $.native.openNotifications();
      await $.native.enableWifi();
      await $.native.disableWifi();
      await $.native.enableWifi();
      await $.native.pressBack();

      await $(#emailTextField).enterText('bartek@awesome.com');
      await $(#nameTextField).enterText('Bartek');
      await $(#passwordTextField).enterText('ny4ncat');
      await $(#termsCheckbox).tap();
      await $(#signUpButton).tap();

      expect($('app'), findsOneWidget);


    },
  );
}
