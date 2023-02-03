import 'package:flutter_test/flutter_test.dart';

import 'shared_preferences_service.dart';

void main() {
  test('Test - set - shared_preferences service - String', () async {
    String a = "Uma string";

    expect(await SharedPreferencesServiceMock.setPreference("STRING", a),
        "String");
  });
  test('Test - set - shared_preferences service - int', () async {
    int a = 1;

    expect(await SharedPreferencesServiceMock.setPreference("INT", a), "int");
  });
  test('Test - set - shared_preferences service - List<String>', () async {
    List<String> a = ["ronan", "julia"];

    expect(await SharedPreferencesServiceMock.setPreference("List", a), "List");
  });
  test('Test - set - Error - shared_preferences service - List<String>', () async {
    String a = "as";

    expect(
        await SharedPreferencesServiceMock.setPreference("List", a), "String");
  });
  test('Test - get - shared_preferences service - List<String>', () async {
    expect(
        await SharedPreferencesServiceMock.getPreference("List"), ['ronan', 'julia']);
  });
}
