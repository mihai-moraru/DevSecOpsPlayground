// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'config.dart';
import 'package:my_movie_app/main.dart' as app;

// This is an example integration test using Patrol. Use it as a base to
// create your own Patrol-powered test.
//
// To run it, you have to use `patrol drive` instead of `flutter test`.

void main() {
  patrolTest(
    'sign in',
    config: patrolConfig,
    nativeAutomation: true,
    ($) async {
      await $.pumpWidgetAndSettle(const app.MyApp());
      // await $.native.pressHome();
      // await $.native.pressDoubleRecentApps();
      // await $.native.openNotifications();
      // await $.native.enableWifi();
      // await $.native.disableWifi();
      // await $.native.enableWifi();
      // await $.native.pressBack();

      await $(#email_input).enterText('test@learningday.com');
      // await $(#nameTextField).enterText('Mihai');
      await $(#password_input).enterText('password');
      // await $(#termsCheckbox).tap();
      await $(#login_btn).tap();

      // expect($('app'), findsOneWidget);
      expect($(#main_appBar), findsOneWidget);
      await $.native.openNotifications();
    },
  );
}
