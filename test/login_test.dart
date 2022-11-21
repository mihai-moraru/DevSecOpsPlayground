import 'package:flutter_test/flutter_test.dart';
import 'package:my_movie_app/main.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'login',
    ($) async {
      await $.pumpWidgetAndSettle(const MyApp());

      await $(#email_input).enterText('mihai@maersk.com');
      await $(#password_input).enterText('testPassword');
      await $(#login_btn).tap();
    },
  );

  // testWidgets('Should test widget with http call', (WidgetTester tester) async {
  //   var booking = <String, String>{
  //     'campus_id': '2f4fccd2-e199-4989-bad3-d8c48e66a15e'
  //   };

  //   await tester.pumpWidget(TestApp(BookingDetails(booking)));
  //   expect(find.text('Loading...'), findsOneWidget);

  //   await tester.pump();
  //   expect(find.text('Displaying data'), findsOneWidget);
  // });
}
