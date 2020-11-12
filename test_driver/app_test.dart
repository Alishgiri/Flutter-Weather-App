import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  group("HomeView Integration Test", () {
    final saveTextWidget = find.byValueKey("save");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) driver.close();
    });

    test('Save button check test', () async {
      expect(await driver.getText(saveTextWidget), "Save");
    });
  });
}
