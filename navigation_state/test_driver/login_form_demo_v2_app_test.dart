import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('통합테스트 > ', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('로그인 테스트', () async {
      const email = 'flutter@gmail.com';
      const ps = '1234';

      await driver.tap(find.byValueKey('email'));
      await driver.enterText(email);
      await driver.waitFor(find.text(email));

      await driver.tap(find.byValueKey('password'));
      await driver.enterText(ps);

      await driver.tap(find.byValueKey('login'));

      await driver.waitFor(find.text('로그인 완료 : $email'));
    });

    tearDownAll(() async {
      driver?.close();
    });
  });
}
