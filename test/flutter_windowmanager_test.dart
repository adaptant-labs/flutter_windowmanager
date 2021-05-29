import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const MethodChannel channel = MethodChannel('flutter_windowmanager');
  final List<MethodCall> log = <MethodCall>[];

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      return true;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
    log.clear();
  });

  test('addFlags', () async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    expect(
      log,
      <Matcher>[
        isMethodCall('addFlags', arguments: <String, int>{
          'flags': FlutterWindowManager.FLAG_SECURE,
        })
      ],
    );
  });

  test('clearFlags', () async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    expect(
      log,
      <Matcher>[
        isMethodCall('clearFlags', arguments: <String, int>{
          'flags': FlutterWindowManager.FLAG_SECURE,
        })
      ],
    );
  });
}
